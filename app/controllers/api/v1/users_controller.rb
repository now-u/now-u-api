class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  MAILCHIMP_LIST_ID = 'b604a851dc'

  def destroy
    remove_from_mailing_list(@user)
    @user.destroy

    render json: {}, status: :ok
  end

  def update
    code = user_params[:organisation_code]
    transformed_user_params = user_params.except(:organisation_code).merge(organisation_id: organisation_id_from_code(code))
    @user.update(transformed_user_params)
    render json: @user, status: :ok
  end

  def create
    user = User.find_by(email: user_params[:email]&.downcase) || User.create!(email: user_params[:email]&.downcase, full_name: user_params[:full_name], token: SecureRandom.hex(40))
    send_registration_email(user)
    add_to_mailing_list(user) if params[:newsletter_signup]

    render json: {}, status: :ok
  end

  def show
    render json: user_response, status: :ok
  end

  private

  def user_params
    params.permit(:email, :full_name, :location, :date_of_birth, :monthly_donation_limit, :home_owner, :organisation_code)
  end

  def add_to_mailing_list(user)
    client = MailingListClient.new
    client.add_to_list(list_id: MAILCHIMP_LIST_ID, email_address: user.email, name: user.full_name)
  end

  def remove_from_mailing_list(user)
    client = MailingListClient.new
    client.remove_from_list(list_id: MAILCHIMP_LIST_ID, email_address: user.email)
  end

  def send_registration_email(user)
    client = SesEmailClient.new(email: user.email, body: email_body(user))
    client.send
  end

  def email_body(user)
    host = request.base_url
    param_link = "https://now-u.com/loginMobile?token%3D#{user.token}&apn=com.nowu.app&isi=1516126639&ibi=com.nowu.app"
    url = "https://nowu.page.link/?link=#{param_link}"
    token = user.token
    ERB.new(File.read( File.expand_path('app/views/login.html.erb') )).result(binding)
  end

  def organisation_id_from_code(code)
    return nil unless code

    Organisation.find_by_code!(code).id
  end

  # def email_body(user)
  #   url = "https://now-u.com/loginMobile?token=#{user.token}&apn=com.nowu.app"
  #   "<html><head></head><body>Thanks for registering! You can login with the following link:<br /><br /> <a href=\"https://nowu.page.link/?link=#{url}\">Click me</a></body></html>"
  # end
end

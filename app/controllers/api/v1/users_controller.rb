class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def update
    @user.update(user_params)

    render json: @user, status: :ok
  end

  def create
    user = User.find_by(email: params[:email]) || User.create!(email: params[:email], token: SecureRandom.hex(40))
    send_registration_email(user)

    render json: {}, status: :ok
  end

  def show
    render json: user_response, status: :ok
  end

  private

  def user_params
    params.permit(:email, :full_name, :location, :date_of_birth, :monthly_donation_limit, :home_owner, :organisation_code)
  end

  def send_registration_email(user)
    client = EmailClient.new(email: user.email, body: email_body(user))
    client.send
  end

  def email_body(user)
    host = request.base_url
    param_link = "https://now-u.com/loginMobile?token%3D#{user.token}&apn=com.nowu.app&isi=1516126639&ibi=com.nowu.app"
    url = "https://nowu.page.link/?link=#{param_link}"
    ERB.new(File.read( File.expand_path('app/views/login.html.erb') )).result(binding)
  end

  # def email_body(user)
  #   url = "https://now-u.com/loginMobile?token=#{user.token}&apn=com.nowu.app"
  #   "<html><head></head><body>Thanks for registering! You can login with the following link:<br /><br /> <a href=\"https://nowu.page.link/?link=#{url}\">Click me</a></body></html>"
  # end
end

# frozen_string_literal: true

class Api::V1::UsersController < APIApplicationController
  before_action :set_user, only: %i[show update destroy]

  MAILCHIMP_LIST_ID = 'b604a851dc'

  def destroy
    remove_from_mailing_list(@user)
    @user.destroy

    render json: {}, status: :ok
  end

  def update
    code = user_params[:organisation_code]
    organisation = { organisation_id: organisation_id_from_code(code) }.compact
    transformed_user_params = user_params.except(:organisation_code).merge(organisation)
    @user.update(transformed_user_params)
    render json: user_with_organisation, status: :ok
  end

  def create
    user = find_user || create_user
    send_registration_email(user)
    add_to_mailing_list(user) if params[:newsletter_signup]

    render json: {}, status: :ok
  end

  def authenticate_user
    user = find_user
    if user
      begin
        send_registration_email(user)

        render json: {}, status: :ok
      rescue StandardError => e
        Sentry.capture_exception(e)

        render json: {message: "Something went wrong!"}, status: 500
      end
    else
      render text: 'Not Found', status: 404
    end
  end

  def show
    render json: user_response, status: :ok
  end

  private

  def find_user
    User.find_by(email: user_params[:email]&.downcase)
  end

  def create_user
    newsletter_signup = params[:newsletter_signup] || false
    User.create!(email: user_params[:email]&.downcase, full_name: user_params[:full_name],
                 token: SecureRandom.hex(40), newsletter: newsletter_signup)
  end

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
    short_token = user.short_token
    param_link = if params[:platform] == 'web'
                   # insert the web url here.
                   'https://www.example-link.com'
                 else
                   "https://now-u.com/loginMobile?token%3D#{short_token.token}&apn=com.nowu.app&isi=1516126639&ibi=com.nowu.app"
                 end
    url = "https://nowu.page.link/?link=#{param_link}"
    token = short_token.token
    ERB.new(File.read(File.expand_path('app/views/login.html.erb'))).result(binding)
  end

  def organisation_id_from_code(code)
    return nil unless code

    Organisation.find_by_code!(code).id
  end
end

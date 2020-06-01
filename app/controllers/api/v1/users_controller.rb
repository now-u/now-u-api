class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def create
    user = User.find_by(email: params[:email]) || User.create!(email: params[:email], token: SecureRandom.hex(40))
    send_registration_email(user)

    render json: {}, status: :ok
  end

  def show
    render json: { data: @user }, status: :ok
  end

  private

  def send_registration_email(user)
    client = EmailClient.new(email: user.email, body: email_body(user))
    client.send
  end

  def email_body(user)
    # url = "https://now-u.com/loginMobile?email=#{user.email}&token=#{user.token}&apn=com.nowu.app"
    url = "https://now-u.com/loginMobile?token=#{user.token}&apn=com.nowu.app"
    # url = CGI::escape(url)
    "<html><head></head><body>Thanks for registering! You can login with the following link:<br /><br /> <a href=\"https://nowu.page.link/?link=#{url}\">Click me</a></body></html>"
  end
end

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
    data = { data: @user }
    data = data.to_json(
      methods: [:selected_campaigns, :completed_campaigns, :completed_actions, :rejected_actions],
      include: {  }
    )

    render json: data, status: :ok
  end

  private

  def user_params
    params.permit(:email, :full_name, :location, :date_of_birth, :monthly_donation_limit, :home_owner)
  end

  def send_registration_email(user)
    client = EmailClient.new(email: user.email, body: email_body(user))
    client.send
  end

  def email_body(user)
    # url = "https://now-u.com/loginMobile?email=#{user.email}&token=#{user.token}&apn=com.nowu.app"
    # url = "https://now-u.com/loginMobile?token=#{user.token}&apn=com.nowu.app"
    url = "https://nowu.page.link/?link=https://now-u.com/loginMobile?token%3D#{user.token}&apn=com.nowu.app&isi=1516126639&ibi=com.nowu.app"
    # url = CGI::escape(url)
    "<html><head></head><body>Thanks for registering! You can login with the following link:<br /><br /> <a href=\"https://nowu.page.link/?link=#{url}\">Click me</a></body></html>"
  end
end

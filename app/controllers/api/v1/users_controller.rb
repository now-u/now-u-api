class Api::V1::UsersController < ApplicationController
  # before_action :set_user, only: [:show]

  def create
    user = User.find_by(email: params[:email]) || User.create!(email: params[:email], token: SecureRandom.hex(40))
    send_registration_email(user)

    render json: {}, status: :ok
  end

  def show
    user = User.find(params[:id])

    render json: { data: user }, status: :ok
  end

  private

  def send_registration_email(user)
    client = EmailClient.new(email: user.email, body: email_body(user))
    client.send
  end

  def email_body(user)
    "Thanks for registering! You can login with the following link: http://mylink.com?email=#{user.email}&token=#{user.token}"
  end

  def set_user
  end
end

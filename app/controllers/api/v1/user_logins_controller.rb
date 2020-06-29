class Api::V1::UserLoginsController < ApplicationController
  before_action :validate_token, only: [:create]

  def create
    token = SecureRandom.hex(40)
    @user.update_attributes(verified: true, token: token)
    response = { 'token' => token }

    render json: { data: response }, status: :ok
  end

  private

  def validate_token
    @user = User.find_by(email: params[:email]&.downcase, token: params[:token])

    return if @user

    render json: {}, status: :unauthorized
  end
end

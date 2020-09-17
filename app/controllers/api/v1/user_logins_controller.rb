class Api::V1::UserLoginsController < ApplicationController
  before_action :validate_token, only: [:create]

  def create
    @user.update_attributes(verified: true)
    response = { 'token' => @user.token }

    render json: { data: response }, status: :ok
  end

  private

  def validate_token
    token = params[:token]&.strip
    email = params[:email]&.strip&.downcase
    @user = UserToken.valid.joins(:user).where(token: token).where('users.email = ?', email).first&.user

    return if @user

    render json: {}, status: :unauthorized
  end
end

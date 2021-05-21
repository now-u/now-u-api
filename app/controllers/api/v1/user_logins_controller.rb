# frozen_string_literal: true

class Api::V1::UserLoginsController < APIApplicationController
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

    status = :unauthorized
    status = 419 if UserToken.invalid.joins(:user).where(token: token).where('users.email = ?', email).any?

    render json: {}, status: status
  end
end

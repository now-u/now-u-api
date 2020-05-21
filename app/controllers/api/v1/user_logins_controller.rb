class Api::V1::UserLoginsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.token != params[:token]
      response = {}
      status = :unauthorized
    else
      user.update_attributes(verified: true, token: SecureRandom.hex(40))
      status = :ok
      response = { 'token' => user.token }
    end

    render json: { data: response }, status: status
  end
end

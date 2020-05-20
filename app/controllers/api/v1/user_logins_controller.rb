class Api::V1::UserLoginsController < ApplicationController
  def create
    user = User.find(params[:id])
    if user.token != params[:token]
      response = {}
      status = :unauthorized
    else
      response = user
      status = :ok
      user.update_attributes(verified: true, token: SecureRandom.hex(40))
    end

    render json: { data: response }, status: status
  end
end

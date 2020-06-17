class Api::V1::UserActionsController < ApplicationController
  before_action :set_user

  def index
    render json: { data: @user.actions }, status: :ok
  end

  def create
    UserAction.where(user_id: @user.id, action_id: params[:id]).first_or_create.update(status: action_status)

    render json: user_response, status: :ok
  end

  def destroy
    UserAction.where(user_id: @user.id, action_id: params[:id]).destroy_all

    render json: user_response, status: :ok
  end

  private

  def action_status
    return 'rejected' if params[:status] == 'reject'

    'completed'
  end
end

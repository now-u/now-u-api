# frozen_string_literal: true

class Api::V1::UserActionsController < APIApplicationController
  before_action :set_user

  def index
    render json: { data: @user.campaign_actions }, status: :ok
  end

  def create
    update_params = { status: action_status, comment: params[:reason] }.compact
    UserAction.where(user_id: @user.id, campaign_action_id: params[:id]).first_or_create.update(update_params)
    render json: user_response, status: :ok
  end

  def destroy
    UserAction.where(user_id: @user.id, campaign_action_id: params[:id]).destroy_all

    render json: user_response, status: :ok
  end

  private

  def action_status
    return 'rejected' if params[:status] == 'reject'
    return 'favourited' if params[:status] == 'favourite'

    'completed'
  end
end

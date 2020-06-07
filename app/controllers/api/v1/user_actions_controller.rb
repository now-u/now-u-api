class Api::V1::UserActionsController < ApplicationController
  before_action :set_user

  def index
    render json: { data: @user.actions }, status: :ok
  end

  def create
    UserAction.where(user_id: @user.id, action_id: params[:id]).first_or_create.update(status: action_status)
    update_user_points

    render json: user_response, status: :ok
  end

  def destroy
  end

  private

  def update_user_points
    @user.increment!(:points, 5) if params[:status] == 'complete'
    decrement = [@user.points, 5].min
    @user.decrement!(:points, decrement) if params[:status] == 'reject'
  end

  def action_status
    return 'rejected' if params[:status] == 'reject'

    'completed'
  end

  def user_response
    data = { data: @user }
    data = data.to_json(
      methods: [:selected_campaigns, :completed_campaigns, :completed_actions, :rejected_actions]
    )
  end  
end

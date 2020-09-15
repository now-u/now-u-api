class Api::V1::UserNotificationsController < ApplicationController
  before_action :set_user

  def index
    render json: { data: @user.active_notifications }, status: :ok
  end

  def update
    UserNotification.where(user_id: @user.id, notification_id: params[:id]).update_all(dismissed: true)
    render json: user_response, status: :ok
  end
end
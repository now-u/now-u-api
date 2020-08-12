class Api::V1::UserNotificationsController < ApplicationController
  before_action :set_user

  def update
    UserNotification.where(user_id: @user.id, notification_id: params[:id]).update_all(dismissed: true)
    render json: user_response, status: :ok
  end
end

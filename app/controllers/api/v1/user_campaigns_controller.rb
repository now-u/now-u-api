class Api::V1::UserCampaignsController < ApplicationController
  before_action :set_user

  def index
    render json: { data: @user.campaigns }, status: :ok
  end

  def create
    UserCampaign.where(user_id: @user.id, campaign_id: params[:id]).first_or_create
    @user.increment!(:points, 10)

    render json: user_response, status: :ok
  end

  def destroy
    UserCampaign.where(user_id: @user.id, campaign_id: params[:id]).destroy_all
    decrement = [10, @user.points].min
    @user.decrement!(:points, decrement)

    render json: user_response, status: :ok
  end
end
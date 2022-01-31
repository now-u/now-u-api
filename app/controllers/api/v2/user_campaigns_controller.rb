# frozen_string_literal: true

class Api::V2::UserCampaignsController < APIApplicationController
  before_action :set_user

  def index
    render json: user_campaigns_data, status: :ok
  end

  def create
    UserCampaign.where(user_id: @user.id, campaign_id: params[:id]).first_or_create!

    render json: user_response, status: :ok
  end

  def destroy
    UserCampaign.where(user_id: @user.id, campaign_id: params[:id]).destroy_all

    render json: user_response, status: :ok
  end

  private

  def user_campaigns_data
    { data: @user.campaigns }.to_json(
      methods: %i[causes]
    )
  end
end

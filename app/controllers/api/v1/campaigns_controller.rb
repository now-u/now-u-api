class Api::V1::CampaignsController < ApplicationController
  before_action :set_user

  def index
    render json: campaign_data, root: 'data', status: :ok, adapter: :json
  end

  def show
    render json: Campaign.find(params[:id]), root: 'data', status: :ok, adapter: :json
  end

  private

  def campaign_data
    return Campaign.current_and_future if @user && @user.campaign_admin?

    if params[:old]
      Campaign.where('end_date < ?', DateTime.now).all
    else
      Campaign.active.all
    end
  end

  def set_user
    token = request.headers['token']
    @user = User.find_by(token: token)
  end
end

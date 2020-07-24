class Api::V1::CampaignsController < ApplicationController
  def index
    render json: campaign_data, root: 'data', status: :ok, adapter: :json
  end

  def show
    render json: Campaign.find(params[:id]), root: 'data', status: :ok, adapter: :json
  end

  private

  def campaign_data
    if params[:old]
      Campaign.where('end_date < ?', DateTime.now).all
    else
      Campaign.active.all
    end
  end
end

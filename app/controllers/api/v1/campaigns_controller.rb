class Api::V1::CampaignsController < ApplicationController
  def index
    render json: Campaign.active.all, root: 'data', status: :ok, adapter: :json
  end

  def show
    render json: Campaign.find(params[:id]), root: 'data', status: :ok, adapter: :json
  end
end

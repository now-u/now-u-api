class Api::V1::CampaignsController < ApplicationController
  def index
    render json: { data: Campaign.all }, status: :ok
  end

  def show
    render json: { data: Campaign.find(params[:id]) }, status: :ok
  end
end

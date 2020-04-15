class Api::V1::CampaignsController < ApplicationController
  def index
    render json: { data: Campaign.all }, status: :ok
  end
end

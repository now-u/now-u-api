class Api::V1::CampaignsController < ApplicationController
  def index
    data = { data: Campaign.all }

    render json: data.to_json(include: [:actions]), status: :ok
  end

  def show
    render json: { data: Campaign.find(params[:id]) }, status: :ok
  end
end

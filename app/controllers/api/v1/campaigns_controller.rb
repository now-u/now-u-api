class Api::V1::CampaignsController < ApplicationController
  def index
    data = { data: Campaign.all }

    render json: data.to_json(include: [:actions]), status: :ok
  end

  def show
    data = { data: Campaign.find(params[:id]) }

    render json: data.to_json(include: [:actions]), status: :ok
  end
end

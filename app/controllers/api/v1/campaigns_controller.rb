class Api::V1::CampaignsController < ApplicationController
  def index
    data = { data: Campaign.all }
    data = data.to_json(
      methods: [:general_partners, :campaign_partners, :sdgs],
      include: { actions: {}, learning_topics: {} }
    )

    render json: data, status: :ok
  end

  def show
    data = { data: Campaign.find(params[:id]) }

    render json: data.to_json(include: [:actions]), status: :ok
  end
end

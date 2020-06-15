class Api::V1::CampaignsController < ApplicationController
  def index
    data = { data: Campaign.all }
    data = data.to_json(
      methods: [:number_of_campaigners, :general_partners, :campaign_partners, :sdgs],
      include: { actions: {}, learning_topics: {} }
    )

    render json: data, status: :ok
  end

  def show
    data = { data: Campaign.find(params[:id]) }
    data = data.to_json(
      methods: [:number_of_campaigners],
      include: [:actions, :campaign_partners]
    )
    render json: data, status: :ok
  end
end

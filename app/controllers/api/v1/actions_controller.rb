# frozen_string_literal: true

class Api::V1::ActionsController < APIApplicationController
  def index
    render json: { data: CampaignAction.active.where(campaign_id: params[:id]) }, status: :ok
  end

  def show
    campaign_action = CampaignAction.find(params[:id])
    data = { data: campaign_action }
    data = data.to_json(
      include: [campaign: { methods: [:number_of_campaigners] }]
    )

    render json: data, status: :ok
  end
end

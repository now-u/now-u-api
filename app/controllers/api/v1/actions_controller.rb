class Api::V1::ActionsController < ApplicationController
  def index
    render json: { data: Action.active.where(campaign_id: params[:id]) }, status: :ok
  end

  def show
    action = Action.find(params[:id])
    data = { data: action }
    data = data.to_json(
      include: [campaign: { methods: [:number_of_campaigners] }]
    )

    render json: data, status: :ok
  end
end

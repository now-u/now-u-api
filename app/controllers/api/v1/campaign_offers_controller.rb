# frozen_string_literal: true

class Api::V1::CampaignOffersController < APIApplicationController
  def index
    render json: { data: Campaign.find(params[:id]).offers }, status: :ok
  end
end

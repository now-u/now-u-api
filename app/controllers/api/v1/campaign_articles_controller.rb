# frozen_string_literal: true

class Api::V1::CampaignArticlesController < APIApplicationController
  def index
    render json: { data: Campaign.find(params[:id]).articles }, status: :ok
  end
end

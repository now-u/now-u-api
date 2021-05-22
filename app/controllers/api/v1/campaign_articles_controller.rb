# frozen_string_literal: true

class Api::V1::CampaignArticlesController < APIApplicationController
  def index
    render json: { data: Article.where(campaign_id: params[:id]) }, status: :ok
  end
end

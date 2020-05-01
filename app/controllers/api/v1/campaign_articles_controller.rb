class Api::V1::CampaignArticlesController < ApplicationController
  def index
    render json: { data: Article.where(campaign_id: params[:id]) }, status: :ok
  end
end

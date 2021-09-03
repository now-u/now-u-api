# frozen_string_literal: true

class Api::V1::ActionArticlesController < APIApplicationController
  def index
    render json: { data: Article.where(campaign_action_id: params[:id]) }, status: :ok
  end
end

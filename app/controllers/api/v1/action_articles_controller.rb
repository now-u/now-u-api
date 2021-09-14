# frozen_string_literal: true

class Api::V1::ActionArticlesController < APIApplicationController
  def index
    render json: { data: Campaign.find(params[:campaign_id]).campaign_actions.find(params[:id]).articles }, status: :ok
  end
end

# frozen_string_literal: true

class Api::V1::PressCoverageArticlesController < APIApplicationController
  def index
    render json: { data: PressCoverageArticle.all }, status: :ok
  end

  def show
    render json: { data: PressCoverageArticle.find(params[:id]) }, status: :ok
  end
end

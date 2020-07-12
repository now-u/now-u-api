class Api::V1::PressCoverageArticlesController < ApplicationController
  def index
    render json: { data: PressCoverageArticle.all }, status: :ok
  end

  def show
    render json: { data: PressCoverageArticle.find(params[:id]) }, status: :ok
  end
end

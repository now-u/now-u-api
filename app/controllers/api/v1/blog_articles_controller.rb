class Api::V1::BlogArticlesController < ApplicationController
  def index
    render json: { data: BlogArticle.all }, status: :ok
  end

  def show
    render json: { data: BlogArticle.find(params[:id]) }, status: :ok
  end
end

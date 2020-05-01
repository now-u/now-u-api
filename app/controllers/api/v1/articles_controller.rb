class Api::V1::ArticlesController < ApplicationController
  def index
    render json: { data: Article.all }, status: :ok
  end

  def show
    render json: { data: Article.find(params[:id]) }, status: :ok
  end
end

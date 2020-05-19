class Api::V1::ArticlesController < ApplicationController
  def index
    render json: { data: Article.order('video_of_the_day DESC, id DESC').all }, status: :ok
  end

  def show
    render json: { data: Article.find(params[:id]) }, status: :ok
  end
end

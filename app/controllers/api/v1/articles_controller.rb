class Api::V1::ArticlesController < ApplicationController
  def show
    render json: { data: Article.find(params[:id]) }, status: :ok
  end
end

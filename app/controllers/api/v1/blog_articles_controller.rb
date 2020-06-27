class Api::V1::BlogArticlesController < ApplicationController
  def index
    render json: { data: BlogArticle.all }, status: :ok
  end

  def show
    data = { data: BlogArticle.find(params[:id]) }
    data = data.to_json(
      include: [:text_sections, :image_sections]
    )
    render json: data, status: :ok
  end
end

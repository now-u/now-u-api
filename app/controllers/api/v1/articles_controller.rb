class Api::V1::ArticlesController < ApplicationController
  def index
    render json: { data: Article.where(action_id: params[:id]) }, status: :ok
  end
end

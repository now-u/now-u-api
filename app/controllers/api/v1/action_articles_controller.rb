# frozen_string_literal: true

class Api::V1::ActionArticlesController < ApplicationController
  def index
    render json: { data: Article.where(action_id: params[:id]) }, status: :ok
  end
end

class Api::V1::ActionsController < ApplicationController
  def index
    render json: { data: Action.where(campaign_id: params[:id]) }, status: :ok
  end

  def show
    render json: { data: Action.find(params[:id]) }, status: :ok
  end
end

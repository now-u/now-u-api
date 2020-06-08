class Api::V1::ActionsController < ApplicationController
  def index
    render json: { data: Action.where(campaign_id: params[:id]) }, status: :ok
  end

  def show
    campaign_id = 
    render json: { 
      data: Action.find(params[:id]), 
      campaign: Campaign.find(Action.find(params[:id]).campaign_id) 
      }, 
      status: :ok
  end
end

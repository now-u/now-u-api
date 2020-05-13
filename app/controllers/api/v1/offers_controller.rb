class Api::V1::OffersController < ApplicationController
  def index
    render json: { data: Offer.all }, status: :ok
  end

  def show
    render json: { data: Offer.find(params[:id]) }, status: :ok
  end
end
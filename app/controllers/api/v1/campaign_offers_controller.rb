# frozen_string_literal: true

class Api::V1::CampaignOffersController < ApplicationController
  def index
    render json: { data: Offer.where(campaign_id: params[:id]) }, status: :ok
  end
end

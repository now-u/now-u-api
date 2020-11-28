# frozen_string_literal: true

class Api::V1::ActionOffersController < ApplicationController
  def index
    render json: { data: Offer.where(action_id: params[:id]) }, status: :ok
  end
end

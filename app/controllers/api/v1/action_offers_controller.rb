# frozen_string_literal: true

class Api::V1::ActionOffersController < APIApplicationController
  def index
    render json: { data: Offer.where(action_id: params[:id]) }, status: :ok
  end
end

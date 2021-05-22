# frozen_string_literal: true

class Api::V1::FaqsController < APIApplicationController
  def index
    render json: { data: Faq.all }, status: :ok
  end
end

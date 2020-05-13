class Api::V1::FaqsController < ApplicationController
  def index
    render json: { data: Faq.all }, status: :ok
  end
end

# frozen_string_literal: true

class Api::V1::CausesController < APIApplicationController
  def index
    render json: causes, root: 'data', status: :ok, adapter: :json
  end

  def show
    render json: Cause.find(params[:id])
  end

  private

  def causes
    Cause.all
  end
end

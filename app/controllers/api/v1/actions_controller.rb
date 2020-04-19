class Api::V1::ActionsController < ApplicationController
  def show
    render json: { data: Action.find(params[:id]) }, status: :ok
  end
end

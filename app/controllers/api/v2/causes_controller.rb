# frozen_string_literal: true

class Api::V2::CausesController < APIApplicationController
  def index
    render json: Cause.all, root: :data, status: :ok, adapter: :json, request: request, user: user, each_serializer: V2::CauseSerializer
  end

  def show
    render json: Cause.find(params[:id]), root: :data, status: :ok, adapter: :json, request: request, user: user, serializer: V2::CauseSerializer
  end
end

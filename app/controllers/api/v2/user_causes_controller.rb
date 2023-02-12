# frozen_string_literal: true

class Api::V2::UserCausesController < APIApplicationController
  rescue_from JSON::ParserError, with: :invalid_json_message

  before_action :set_user, only: [:create, :show]

  def create
    if causes_from_params && user.causes = causes_from_params
      render json: { data: "User successfully added to causes" }, status: :ok
    else
      render json: { data: "Something went wrong" }, status: 501
    end
  end

  def show
    render json: { data: user.causes }, status: :ok
  end

private

  def causes_from_params
    return nil unless params["cause_ids"]

    params["cause_ids"]&.map do |cid|
      Cause.find(cid)
    end
  end
end

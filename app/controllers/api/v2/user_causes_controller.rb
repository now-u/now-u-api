# frozen_string_literal: true

class Api::V2::UserCausesController < APIApplicationController
  rescue_from JSON::ParserError, with: :invalid_json_message

  before_action :set_user, only: [:create]

  def create
    if user.causes = causes_from_params
      render json: { data: "User successfully added to causes" }, status: :ok
    else
      render json: { data: "Something went wrong" }, status: 501
    end
  end

private

  def causes_from_params
    JSON(params["cause_ids"]).map do |cid|
      Cause.find(cid)
    end
  end
end

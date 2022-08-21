# frozen_string_literal: true

class Api::V2::CausesController < APIApplicationController
  def index
    render json: { data: causes_data }, status: :ok
  end

  def show
    render json: { data: cause_data }, status: :ok
  end

private

  def causes_data
    Cause.all.map do |a|
      a.serializable_hash.symbolize_keys.merge(additional_fields(a.id))
    end
  end

  def cause_data
    Cause.find(params[:id]).serializable_hash.symbolize_keys.merge(additional_fields(params[:id]))
  end

  def additional_fields(cause_id)
    {
      joined: get_status(cause_id)
    }
  end

  def get_status(cause_id)
    return 'Authentication failed' unless request.headers['token'] && user

    user.causes.ids.include?(cause_id)
  end
end

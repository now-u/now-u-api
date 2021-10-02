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
    # TODO: How do we find out if a user has "joined" a cause?
    # @user = User.find_by token: request.headers['token']
    # return authentication_failed unless @user

    # {
    #   completed: @user.user_causes.find_by(cause: cause_id)&.status,
    # }
    {
      joined: "Not yet implemented"
    }
  end

  def authentication_failed
    {
      completed: "Authentication failed"
    }
  end
end

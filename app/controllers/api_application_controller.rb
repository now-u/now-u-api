# frozen_string_literal: true

class APIApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from V2::Filters::Filter::InvalidFilter, with: :invalid_filter_message

  private

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

  def set_user
    token = request.headers['token']
    @user = User.find_by(token: token)

    render json: { message: "User authorization failed" }, status: :unauthorized unless @user&.verified
  end

  def user
    @user ||= User.find_by token: request.headers['token']
  end

  def user_response
    data = { data: @user.reload }
    data = data.to_json(
      methods: %i[selected_campaigns completed_campaigns completed_actions
                  rejected_actions favourited_actions completed_learning_resources
                  active_notifications organisation]
    )
  end

  def user_with_organisation
    data = { data: @user.reload }
    data = data.to_json(
      methods: [:organisation]
    )
  end

  def invalid_json_message(exception)
    render json: { data: "There was an error when parsing the JSON. #{exception}" }
  end

  def invalid_filter_message(exception)
    render json: { data: exception }, status: 501
  end
end

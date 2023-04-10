# frozen_string_literal: true
include Pagy::Backend

class APIApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from V2::Filters::Filter::InvalidFilter, with: :invalid_filter_message

  private

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

  def user
    @user ||= User.get_user_from_request(request)
  end

  def set_user
    render json: { message: "User authorization failed" }, status: :unauthorized unless user
  end

  def user_response
    data = { data: @user.reload }
    data = data.to_json(
      methods: %i[selected_campaigns completed_campaigns completed_actions
                  rejected_actions favourited_actions completed_learning_resources
                  active_notifications organisation cause_ids]
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

  def get_campaign_action_status(token, action_id)
    return false unless user

    user.user_actions.find_by(campaign_action_id: action_id).present?
  end

  def get_campaign_status(token, campaign_id)
    return false unless user

    user.user_campaigns.find_by(campaign_id: campaign_id).present?
  end

  def get_learning_resource_status(token, learning_resource_id)
    return false unless user

    user.user_learning_resources.find_by(learning_resource_id: learning_resource_id).present?
  end
end

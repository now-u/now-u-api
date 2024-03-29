# frozen_string_literal: true
include ::V2::Progress::UserProgress

class Api::V2::CampaignActionsController < APIApplicationController
  rescue_from JSON::ParserError, with: :invalid_json_message

  def index
    render json: { data: actions_data }, status: :ok
  end

  def show
    render json: { data: action_data }, status: :ok
  end

private

  def actions_data
    ::V2::Filters::Filter.new(request: request, filter_model: ::V2::Filters::CampaignActionFilter, data: CampaignAction.all).call.map do |campaign|
      merge_additional_fields(campaign)
    end
  end

  def action_data
    CampaignAction.find(params[:id]).serializable_hash.symbolize_keys.merge(additional_fields(params[:id]))
  end

  def additional_fields(action_id)
    {
      causes: get_campaign_action_causes(action_id),
      completed: get_campaign_action_status(request.headers['token'], action_id),
    }
  end

  def merge_additional_fields(model)
    model.serializable_hash.symbolize_keys.merge(additional_fields(model.id))
  end

  def get_campaign_action_causes(action_id)
    CampaignAction.find(action_id)&.causes.map do |cac|
      cac.serializable_hash.symbolize_keys.merge({joined: get_status(cac.id, request)})
    end
  end
end

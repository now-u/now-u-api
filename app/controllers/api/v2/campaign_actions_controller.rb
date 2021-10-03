# frozen_string_literal: true

class Api::V2::CampaignActionsController < APIApplicationController
  def index
    render json: { data: actions_data }, status: :ok
  end

  def show
    render json: { data: action_data }, status: :ok
  end

private

  def actions_data
    CampaignAction.all.map do |a|
      a.serializable_hash.symbolize_keys.merge(additional_fields(a.id))
    end
  end

  def action_data
    CampaignAction.find(params[:id]).serializable_hash.symbolize_keys.merge(additional_fields(params[:id]))
  end

  def additional_fields(action_id)
    {
      causes: CampaignAction.find(action_id)&.causes,
      completed: get_status(action_id),
    }
  end

  def get_status(action_id)
    return 'Authentication failed' unless request.headers['token'] && user

    user.user_actions.find_by(campaign_action_id: action_id)&.status
  end
end

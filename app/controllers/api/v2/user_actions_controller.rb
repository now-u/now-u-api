# frozen_string_literal: true

class Api::V2::UserActionsController < APIApplicationController
  before_action :set_user

  def index
    render json: { data: user_actions_data }, status: :ok
  end

  def show
    render json: { data: user_action_data }, status: :ok
  end

private

  def user_actions_data
    @user.campaign_actions.map do |a|
      a.serializable_hash.symbolize_keys.merge(additional_fields(a.id))
    end
  end

  def user_action_data
    @user.campaign_actions.find(params[:id]).serializable_hash.symbolize_keys.merge(additional_fields(params[:id]))
  end

  def additional_fields(action_id)
    {
      causes: CampaignAction.find(action_id)&.causes,
      status: @user.user_actions.find_by(campaign_action_id: action_id).status,
    }
  end
end

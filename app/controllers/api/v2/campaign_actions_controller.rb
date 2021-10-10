# frozen_string_literal: true

class Api::V2::CampaignActionsController < APIApplicationController
  before_action :set_filter, only: :index

  def index
    render json: { data: actions_data }, status: :ok
  end

  def show
    render json: { data: action_data }, status: :ok
  end

private

  def actions_data
    return @filter.call.map {|c| merge_additional_fields(c)} unless @filter.query_params.nil?

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

  def merge_additional_fields(model)
    model.serializable_hash.symbolize_keys.merge(additional_fields(model.id))
  end

  def get_status(action_id)
    return 'Authentication failed' unless request.headers['token'] && user

    user.user_actions.find_by(campaign_action_id: action_id)&.status
  end

  def set_filter
    @filter = ::V2::Filters::Filter.new(request_url: request.url, filter_model: ::V2::Filters::CampaignActionFilter)
  end
end

# frozen_string_literal: true

class Api::V2::CampaignsController < APIApplicationController
  rescue_from JSON::ParserError, with: :invalid_json_message

  def index
    render json: { data: campaigns_data }, status: :ok
  end

  def show
    render json: { data: campaign_data }, status: :ok
  end

private

  def campaigns_data
    ::V2::Filters::Filter.new(request: request, filter_model: ::V2::Filters::CampaignFilter, data: Campaign.all).call.map do |campaign|
      merge_additional_fields(campaign)
    end
  end

  def campaign_data
    merge_additional_fields(Campaign.find(params[:id]))
  end

  def additional_fields(campaign_id)
    {
      causes: Campaign.find(campaign_id)&.causes,
      completed: get_status(campaign_id),
    }
  end

  def get_status(campaign_id)
    return 'Authentication failed' unless request.headers['token'] && user

    user.user_campaigns.find_by(campaign_id: campaign_id)&.status
  end

  def merge_additional_fields(model)
    model.serializable_hash.symbolize_keys.merge(additional_fields(model.id))
  end
end

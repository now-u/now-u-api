# frozen_string_literal: true
include ::V2::Progress::UserProgress

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
    # TODO: at the moment we are returning all campaigns, published, not published, draft, you name it
    # we need to split this into published campaigns for regular users, and 'all' (or maybe just draft + publishd?) 
    # campaigns for admin users. There is currently an enum on User model to do this. 

    ::V2::Filters::Filter.new(request: request, filter_model: ::V2::Filters::CampaignFilter, data: Campaign.all).call.map do |campaign|
      merge_additional_fields(campaign)
    end
  end

  def campaign_data
    campaign.serializable_hash.symbolize_keys.merge(additional_campaign_fields(campaign))
  end

  def campaign
    @campaign ||= Campaign.find(params[:id])
  end

  def additional_fields(campaign)
    {
      causes: get_campaign_causes(campaign),
      completed: get_campaign_status(request.headers['token'], campaign.id),
    }
  end

  def additional_campaign_fields(campaign)
    additional_fields(campaign).merge({
      learning_resources: campaign.learning_resources.map{|lr| lr.attributes.merge({ completed: get_learning_resource_status(request.headers['token'], lr.id) })},
      campaign_actions: campaign.campaign_actions.map{|ca| ca.attributes.merge({ completed: get_campaign_action_status(request.headers['token'], ca.id) }) },
    })
  end

  def merge_additional_fields(model)
    model.serializable_hash.symbolize_keys.merge(additional_fields(model))
  end

  def get_campaign_causes(campaign)
    campaign.causes.map do |cc|
      cc.serializable_hash.symbolize_keys.merge({joined: get_status(cc.id, request)})
    end
  end
end

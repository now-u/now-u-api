# frozen_string_literal: true

class Api::V2::CampaignsController < APIApplicationController
  before_action :set_filter

  def index
    render json: { data: campaigns_data }, status: :ok
  end

  def show
    render json: { data: campaign_data }, status: :ok
  end

private

  def campaigns_data
    return @filter.call.map {|c| merge_additional_fields(c)} unless @filter.query_params.nil?

    Campaign.all.map do |a|
      merge_additional_fields(a)
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

  def set_filter
    @filter = ::V2::Filters::CampaignFilter.new(request.url)
  end
end

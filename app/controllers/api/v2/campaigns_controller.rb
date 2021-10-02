# frozen_string_literal: true

class Api::V2::CampaignsController < APIApplicationController
  def index
    render json: { data: campaigns_data }, status: :ok
  end

  def show
    render json: { data: campaign_data }, status: :ok
  end

private

  def campaigns_data
    Campaign.all.map do |a|
      a.serializable_hash.symbolize_keys.merge(additional_fields(a.id))
    end
  end

  def campaign_data
    Campaign.find(params[:id]).serializable_hash.symbolize_keys.merge(additional_fields(params[:id]))
  end

  def additional_fields(campaign_id)
    @user = User.find_by token: request.headers['token']
    return authentication_failed unless @user

    {
      causes: Campaign.find(campaign_id)&.causes,
      completed: @user.user_campaigns.find_by(campaign_id: campaign_id)&.status,
    }
  end

  def authentication_failed
    {
      completed: "Authentication failed"
    }
  end
end

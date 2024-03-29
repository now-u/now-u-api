# frozen_string_literal: true

class Api::V1::CampaignsController < APIApplicationController
  def index
    render json: campaign_data, root: 'data', status: :ok, adapter: :json
  end

  def show
    render json: Campaign.find(params[:id]), root: 'data', status: :ok, adapter: :json
  end

  private

  def campaign_data
    if params[:old]
      campaigns = Campaign.where('end_date < ?', DateTime.now).all
    else
      campaigns = Campaign.active.all
      campaigns = (campaigns + Campaign.current_and_future).uniq if @user&.campaign_admin?
    end
    campaigns
  end
end

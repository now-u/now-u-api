class Api::Admin::V1::CampaignsController < Api::Admin::V1::AdminController
  before_action :validate_api_key

  def create
    campaign = Campaign.create!(campaign_params)

    render json: campaign, root: true
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :description_app, :number_of_campaigners, :header_image, :video_link, :description_web)
  end
end

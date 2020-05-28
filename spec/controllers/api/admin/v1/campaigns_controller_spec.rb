require 'rails_helper'

RSpec.describe Api::Admin::V1::CampaignsController, type: :controller do
  before do
    request.headers.merge!({ admin_api_key: Rails.application.config.admin_api_key })
  end
  describe '#create' do
    let(:campaign_params) do
      {
        title: 'Refugees',
        description_app: 'Description',
        number_of_campaigners: 1,
        header_image: 'header.jpg',
        video_link: 'video',
        description_web: 'description web'
      }
    end
    subject(:create_campaign) do
      post :create, params: { campaign: campaign_params }
    end

    it 'creates the record' do
      expect { create_campaign }.to change { Campaign.count }.by(1)
    end

    it 'returns 200' do
      create_campaign

      expect(response.status).to eq 200
    end
  end
end

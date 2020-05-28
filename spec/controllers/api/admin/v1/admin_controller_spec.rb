require 'rails_helper'

RSpec.describe Api::Admin::V1::CampaignsController, type: :controller do
  describe '#validate_api_key' do
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

    context 'when api_key not present' do
      it 'returns unauthorised status' do
        create_campaign

        expect(response.status).to eq 401
      end

      it 'does not create record' do
        expect { create_campaign }.not_to change { Campaign.count }
      end
    end

    context 'when api_key invalid' do
      before do
        request.headers.merge!({ admin_api_key: 'meh' })
      end

      it 'returns unauthorised status' do
        create_campaign

        expect(response.status).to eq 401
      end

      it 'does not create record' do
        expect { create_campaign }.not_to change { Campaign.count }
      end
    end

    context 'when api_key valid' do
      before do
        request.headers.merge!({ admin_api_key: Rails.application.config.admin_api_key })
      end

      it 'returns 200 status' do
        create_campaign

        expect(response.status).to eq 200
      end

      it 'creates the record' do
        expect { create_campaign }.to change { Campaign.count }.by(1)
      end
    end
  end
end

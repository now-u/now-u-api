# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UserCampaignsController, type: :controller do
  let(:user) { create(:user, points: points) }
  let(:campaign) { create(:campaign) }

  describe '#create' do
    let(:points) { 0 }
    subject(:create_user_campaign) do
      request.headers.merge!('Authorization' => create_jwt_header(user))
      post :create, params: { id: campaign.id }
    end

    it 'creates the user campaign' do
      expect { create_user_campaign }.to change { UserCampaign.where(user_id: user.id, campaign_id: campaign.id).count }.from(0).to(1)
    end

    it 'increments user points by 10' do
      expect { create_user_campaign }.to change { user.reload.points }.from(0).to(10)
    end
  end

  describe '#destroy' do
    let(:points) { 8 }

    before do
      UserCampaign.create!(user_id: user.id, campaign_id: campaign.id)
    end

    subject(:destroy_user_campaign) do
      request.headers.merge!('Authorization' => create_jwt_header(user))
      delete :destroy, params: { id: campaign.id }
    end

    it 'deletes the user campaign' do
      expect { destroy_user_campaign }.to change { UserCampaign.where(user_id: user.id, campaign_id: campaign.id).count }.from(1).to(0)
    end

    it 'decrements user points by 10' do
      expect { destroy_user_campaign }.to change { user.reload.points }.from(18).to(8)
    end

    it 'returns new points count' do
      destroy_user_campaign

      expect(JSON.parse(response.body)['data']['points']).to eq(8)
    end
  end
end

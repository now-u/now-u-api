require 'rails_helper'

RSpec.describe Api::V1::UserCampaignsController, type: :controller do
  let(:user) { User.create(email: 'ok@ok.com', token: 'abc1234', verified: true) }
  let(:campaign) { Campaign.create!(title: 'My campaign') }

  describe '#create' do
    subject(:create_user_campaign) do
      request.headers.merge!({ 'token' => 'abc1234' })
      post :create, params: { id: campaign.id }
    end

    it 'creates the user campaign' do
      expect { create_user_campaign }.to change { UserCampaign.where(user_id: user.id, campaign_id: campaign.id).count }.from(0).to(1)
    end
  end

  describe '#destroy' do
    before do
      UserCampaign.create!(user_id: user.id, campaign_id: campaign.id)
    end
    subject(:destroy_user_campaign) do
      request.headers.merge!({ 'token' => 'abc1234' })
      delete :destroy, params: { id: campaign.id }
    end

    it 'deletes the user campaign' do
      expect { destroy_user_campaign }.to change { UserCampaign.where(user_id: user.id, campaign_id: campaign.id).count }.from(1).to(0)
    end
  end
end

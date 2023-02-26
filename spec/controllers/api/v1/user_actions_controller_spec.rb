# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UserActionsController, type: :controller do
  let!(:user) { FactoryBot.create(:user, email: 'ok@ok.com', points: points) }
  let!(:campaign) { FactoryBot.create(:campaign) }
  let!(:campaign_action) { FactoryBot.create(:campaign_action, campaign_id: campaign.id, enabled: true)}
  let!(:points) { 0 }

  describe '#destroy' do
    let!(:user_action) do
      UserAction.create!(user_id: user.id, campaign_action_id: campaign_action.id, status: 'completed')
    end
    subject(:delete_user_action) do
      request.headers.merge!('Authorization' => create_jwt_header(user))
      delete :destroy, params: { id: campaign_action.id }
    end

    it 'deletes the user action' do
      expect { delete_user_action }.to change { UserAction.where(user_id: user.id, campaign_action_id: campaign_action.id).count }.from(1).to(0)
    end
  end

  describe '#index' do
    let!(:user_action) do
      UserAction.create!(user_id: user.id, campaign_action_id: campaign_action.id)
    end
    subject(:get_actions) do
      request.headers.merge!('Authorization' => create_jwt_header(user))
      get :index
    end

    before do
      get_actions
    end

    it 'returns the user actions' do
      expect(JSON.parse(response.body)['data'].pluck('id')).to match_array([campaign_action.id])
    end
  end

  describe '#create' do
    let(:points) { 4 }
    let(:status) { 'reject' }
    subject(:create_action_with_status) do
      request.headers.merge!('Authorization' => create_jwt_header(user))
      post :create, params: { id: campaign_action.id, status: status }
    end

    it 'creates the user action with rejected status' do
      expect { create_action_with_status }.to change { UserAction.where(user_id: user.id, campaign_action_id: campaign_action.id, status: 'rejected').count }.from(0).to(1)
    end

    it 'decrements user points' do
      expect { create_action_with_status }.to change { user.reload.points }.from(4).to(0)
    end

    context 'when reason param present' do
      it 'adds to comment field on user_actions' do
      end
    end

    context 'when status complete' do
      let(:points) { 0 }
      let(:status) { 'complete' }

      it 'creates the action with completed status' do
        expect { create_action_with_status }.to change { UserAction.where(user_id: user.id, campaign_action_id: campaign_action.id, status: 'completed').count }.from(0).to(1)
      end

      it 'increments user points' do
        expect { create_action_with_status }.to change { user.reload.points }.from(0).to(5)
      end
    end

    context 'when user action already exists' do
      let(:status) { 'complete' }
      let!(:user_action) do
        UserAction.create!(user_id: user.id, campaign_action_id: campaign_action.id, status: 'rejected')
      end

      it 'updates the user action status' do
        expect { create_action_with_status }.to change { user_action.reload.status }.from('rejected').to('completed')
      end
    end

    context 'when invalid status' do
      let(:status) { 'meh' }

      it 'raises an error' do
        expect { create_action_with_status }.to raise_exception(ActionController::UrlGenerationError)
      end
    end
  end
end

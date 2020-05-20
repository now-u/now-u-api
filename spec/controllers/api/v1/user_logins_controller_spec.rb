require 'rails_helper'

RSpec.describe Api::V1::UserLoginsController, type: :controller do
  describe '#create' do
    let(:verified) { false }
    let(:user) { User.create!(email: 'ok@ok.com', token: 'abc1234567', verified: verified) }
    let(:token) { 'abc1234567' }

    subject(:login_user) do
      post :create, params: { token: token, id: user.id }
    end

    context 'when token is invalid' do
      let(:token) { 'zzzzzzz' }

      before do
        login_user
      end

      it 'returns unauthorised response' do
        expect(response.status).to eq(401)
      end
    end

    context 'when user is not verified' do
      it 'sets verified flag to true' do
        expect { login_user }.to change { user.reload.verified }.from(false).to(true)
      end
    end

    it 'changes the token' do
      expect { login_user }.to change { user.reload.token }
    end    
  end
end

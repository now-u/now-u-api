require 'rails_helper'

RSpec.describe Api::V1::UserLoginsController, type: :controller do
  describe '#create' do
    let(:verified) { false }
    let(:user) { User.create!(email: 'ok@ok.com', token: 'abc1234567', verified: verified) }
    let(:user_token) { user.user_tokens.create! } # temporary token
    # let(:token) { 'abc1234567' }

    subject(:login_user) do
      post :create, params: { token: user_token.token, email: user.email }
    end

    it 'does not change the permanent token' do
      expect { login_user }.not_to change { user.reload.token }
    end

    context 'when temporary token is valid' do
      it 'returns the permanent token' do
        login_user

        expect(JSON.parse(response.body)).to eq({ 'data' => { 'token' => user.token } })
      end

      it 'sets verified flag to true' do
        expect { login_user }.to change { user.reload.verified }.from(false).to(true)
      end

      it 'returns 200 status' do
        login_user

        expect(response.status).to eq(200)
      end
    end

    context 'when temporary token is invalid' do
      before do
        user_token.expire!
        login_user
      end

      it 'returns unauthorised response' do
        expect(response.status).to eq(401)
      end
    end
  end
end

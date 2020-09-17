require 'rails_helper'

RSpec.describe Api::V1::UserLoginsController, type: :controller do
  xdescribe '#create' do
    let(:verified) { false }
    let(:user) { User.create!(email: 'ok@ok.com', token: 'abc1234567', verified: verified) }
    let(:token) { 'abc1234567' }

    subject(:login_user) do
      post :create, params: { token: token, email: user.email }
    end

    it 'changes the token' do
      expect { login_user }.to change { user.reload.token }
    end

    it 'returns the new token' do
      login_user

      expect(JSON.parse(response.body)).to eq({ 'data' => { 'token' => user.reload.token } })
    end

    it 'returns 200 status' do
      login_user

      expect(response.status).to eq(200)
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
  end
end

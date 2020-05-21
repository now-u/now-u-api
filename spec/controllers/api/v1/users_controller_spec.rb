require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe '#create' do
    let(:email) { 'ok@ok.com' }
    let(:email_client) { instance_double(EmailClient, send: 'ok') }

    before do
      allow(EmailClient).to receive(:new).and_return(email_client)
    end

    subject(:register_user) do
      post :create, params: { email: email }
    end

    it 'creates the user' do
      expect { register_user }.to change { User.count }.by(1)
    end

    it 'sends an email' do
      register_user

      expect(email_client).to have_received(:send).once
    end

    it 'returns empty object' do
      register_user

      expect(JSON.parse(response.body)).to eq({})
    end

    it 'returns 200 status' do
      register_user

      expect(response.status).to eq(200)
    end

    context 'when email is not valid' do
    end

    context 'when email is already registered' do
      let!(:user) { User.create(email: 'ok@ok.com', token: 'abc123') }

      it 'does not create a new user' do
        expect { register_user }.not_to change { User.count }
      end

      # it 'changes the token' do
      #   expect { register_user }.to change { user.reload.token }
      # end

      it 'sends an email' do
        register_user

        expect(email_client).to have_received(:send).once
      end
    end
  end

  describe '#show' do
    let(:user) { User.create(email: 'ok@ok.com') }

    subject(:get_user) do
      get :show, params: { id: user.id }
    end

    before do
      get_user
    end

    # context 'when valid token in header' do
      it 'returns the user' do
        expect(JSON.parse(response.body)['data']['email']).to eq(user.email)
      end
    # end

    # context 'when no token in header' do
    # end

    # context 'when invalid token in header' do
    # end
  end
end

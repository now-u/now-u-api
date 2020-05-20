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

    context 'when email is not valid' do
    end

    context 'when email is already registered' do
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

    it 'returns the user' do
      expect(JSON.parse(response.body)['data']['email']).to eq(user.email)
    end
  end
end

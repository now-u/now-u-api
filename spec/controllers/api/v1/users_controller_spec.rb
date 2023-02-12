# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe '#destroy' do
    let(:newsletter_client) { instance_double(MailingListClient, remove_from_list: 'ok') }

    before do
      allow(MailingListClient).to receive(:new).and_return(newsletter_client)
    end

    let(:user) { User.create(email: 'ok@ok.com', token: 'abc1234', verified: true) }
    let(:token) { user.token }

    subject(:delete_user) do
      request.headers.merge!('token' => token)
      delete :destroy
    end

    it 'deletes the user' do
      expect { delete_user }.to change { User.exists?(user.id) }.from(true).to(false)
    end

    it 'makes request to Mailchimp to remove user from mailing list' do
      delete_user
      expect(newsletter_client).to have_received(:remove_from_list).once
    end
  end

  describe '#update' do
    let(:organisation) { Organisation.create(name: 'Org 1', code: 'TEST123') }
    let(:user) { User.create(email: 'ok@ok.com', token: 'abc1234', verified: true) }
    let(:token) { user.token }

    let(:user_params) do
      {
        full_name: 'Dave',
        location: 'Ireland',
        date_of_birth: '16/01/1988',
        monthly_donation_limit: 50.05,
        home_owner: true
      }
    end

    subject(:update_user) do
      request.headers.merge!('token' => token)
      put :update, params: user_params
    end

    it 'updates the user full_name' do
      expect { update_user }.to change { user.reload.full_name }.from(nil).to('Dave')
    end

    it 'updates the user location' do
      expect { update_user }.to change { user.reload.location }.from(nil).to('Ireland')
    end

    it 'updates the user date_of_birth' do
      expect { update_user }.to change { user.reload.date_of_birth }.from(nil).to('16/01/1988')
    end

    it 'updates the user monthly_donation_limit' do
      expect { update_user }.to change { user.reload.monthly_donation_limit }.from(nil).to(50.05)
    end

    it 'updates the user home_owner' do
      expect { update_user }.to change { user.reload.home_owner }.from(nil).to(true)
    end

    context 'when organisation_code present' do
      let(:org_code) { 'TEST123' }
      let(:user_params) do
        {
          full_name: 'Dave',
          location: 'Ireland',
          date_of_birth: '16/01/1988',
          monthly_donation_limit: 50.05,
          home_owner: true,
          organisation_code: org_code
        }
      end

      it 'sets organisation_id' do
        expect { update_user }.to change { user.reload.organisation_id }.from(nil).to(organisation.id)
      end

      # We are currently capturing all invalid records and showing a custom JSON error message. 
      # Commenting this test out until we figure out how else we want to test this.
      # context 'when invalid code' do
      #   let(:org_code) { 'INVALID123' }

      #   it 'raises an error' do
      #     expect { update_user }.to raise_exception(ActiveRecord::RecordNotFound)
      #   end
      # end
    end
  end

  describe '#create' do
    let(:email) { 'ok@ok.com' }
    let(:email_client) { instance_double(SesEmailClient, send: 'ok') }
    let(:newsletter_client) { instance_double(MailingListClient, add_to_list: 'ok') }

    let(:user_params) do
      { email: email }
    end

    before do
      allow(SesEmailClient).to receive(:new).and_return(email_client)
      allow(MailingListClient).to receive(:new).and_return(newsletter_client)
      allow(Gibbon::Request).to receive(:new).and_return(instance_double(Gibbon::Request))
    end

    subject(:register_user) do
      post :create, params: user_params
    end

    it 'creates the user' do
      expect { register_user }.to change { User.count }.by(1)
    end

    context 'when full_name param present' do
      let(:user_params) do
        { email: email, full_name: 'Dave' }
      end

      it 'creates the user with full_name' do
        register_user
        expect(User.last.full_name).to eq('Dave')
      end
    end

    context 'sending emails' do
      context 'with no errors' do
        it 'sends an email' do
          register_user
  
          expect(email_client).to have_received(:send).once
        end
      end
  
      context 'with errors' do
        before do
          allow(email_client).to receive(:send).and_raise(StandardError)
        end

        it 'raises a sentry error' do
          expect(Sentry).to receive(:capture_exception).with StandardError
          
          register_user
        end
      end
    end

    it 'does not add user to mailchimp' do
      register_user

      expect(newsletter_client).not_to have_received(:add_to_list)
    end

    context 'when newsletter_signup param present' do
      let(:user_params) do
        { email: email, full_name: 'Dave', newsletter_signup: true }
      end

      it 'adds the user to Mailchimp' do
        register_user

        expect(newsletter_client).to have_received(:add_to_list).once.with(list_id: Api::V1::UsersController::MAILCHIMP_LIST_ID, email_address: email, name: 'Dave')
      end
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
    let(:user) { User.create(email: 'ok@ok.com', token: 'abc1234', verified: true) }
    let(:token) { user.token }

    subject(:get_user) do
      request.headers.merge!('token' => token)
      get :show
    end

    before do
      get_user
    end

    context 'when valid token in header' do
      it 'returns the user' do
        expect(JSON.parse(response.body)['data']['email']).to eq(user.email)
      end

      it 'returns 200 status' do
        expect(response.status).to eq(200)
      end
    end

    context 'when no token in header' do
      let(:token) { nil }

      it 'returns 401 status' do
        expect(response.status).to eq(401)
      end
    end

    context 'when invalid token in header' do
      let(:token) { 'adddddd' }

      it 'returns 401 status' do
        expect(response.status).to eq(401)
      end
    end
  end

  describe '#authenticate_user' do
    
    let(:user) { User.create(email: 'ok@ok.com', token: 'abc1234', verified: true) }
    let(:email) { user.email }
    let(:user_params) do
      { email: email }
    end
    let(:worng_params) do
      { email: "wrong@email.com"}
    end
    let(:email_client) { instance_double(SesEmailClient, send: 'ok') }

    before do
      allow(SesEmailClient).to receive(:new).and_return(email_client)
    end
    
    it 'should return status 200 if user exists' do
      post :authenticate_user, params: user_params
      expect(response).to have_http_status(200)
    end 
    it 'should return status 404 if no user found' do
      post :authenticate_user, params: worng_params
      expect(response).to have_http_status(404)
    end
  end
  
end

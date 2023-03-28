# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe '#destroy' do
    let(:newsletter_client) { instance_double(MailingListClient, remove_from_list: 'ok') }

    before do
      allow(MailingListClient).to receive(:new).and_return(newsletter_client)
    end

    let(:user) { FactoryBot.create(:user, email: 'ok@ok.com') }

    subject(:delete_user) do
      request.headers.merge!('Authorization' => create_jwt_header(user))
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
    let(:user) { User.create(email: 'ok@ok.com', auth_user_id: "auth_user_id") }
    let(:newsletter_client) { instance_double(MailingListClient, add_to_list: 'ok', remove_from_list: 'ok') }
    
    before do
      allow(MailingListClient).to receive(:new).and_return(newsletter_client)
    end

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
      request.headers.merge!('Authorization' => create_jwt_header(user))
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

    context 'when newsletter_signup param true' do
      let(:user_params) do
        { email: 'ok@ok.com', full_name: 'Dave', newsletter_signup: true }
      end

      it 'adds the user to Mailchimp' do
        update_user  

        expect(newsletter_client).to have_received(:add_to_list).once.with(list_id: Api::V1::UsersController::MAILCHIMP_LIST_ID, email_address: 'ok@ok.com', name: 'Dave')
      end
    end
    
    context 'when newsletter_signup param false' do
      let(:user_params) do
        { email: 'ok@ok.com', full_name: 'Dave', newsletter_signup: false }
      end

      it 'removes the user from Mailchimp' do
        update_user  

        expect(newsletter_client).to have_received(:remove_from_list).once.with(list_id: Api::V1::UsersController::MAILCHIMP_LIST_ID, email_address: 'ok@ok.com')
      end
    end

    it 'does not add or remove user from mailchimp when no newsletter_client param' do
      update_user 
      expect(newsletter_client).not_to have_received(:add_to_list)
      expect(newsletter_client).not_to have_received(:remove_from_list)
    end
  end

  describe '#show' do
    let(:user) { FactoryBot.create(:user, email: 'ok@ok.com') }
    let(:auth_header) { create_jwt_header(user) }

    subject(:get_user) do
      request.headers.merge!('Authorization' => auth_header)
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
      let(:auth_header) { nil }
      it 'returns 401 status' do
        expect(response.status).to eq(401)
      end
    end

    context 'when invalid token in header' do
      let(:auth_header) { "abc" }
      it 'returns 401 status' do
        expect(response.status).to eq(401)
      end
    end
  end
end

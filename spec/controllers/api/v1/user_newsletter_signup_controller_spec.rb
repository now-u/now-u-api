require 'rails_helper'

RSpec.describe Api::V1::UserNewsletterSignupController, type: :controller do
  describe '#update' do
    let(:newsletter_client) { instance_double(MailingListClient, remove_from_list: {}, add_to_list: {}) }

    before do
      allow(MailingListClient).to receive(:new).and_return(newsletter_client)
    end

    let(:newsletter) { false }
    let(:user) { User.create(email: 'ok@ok.com', token: 'abc1234', verified: true, newsletter: newsletter) }
    let(:token) { user.token }
    let(:status) { 'subscribe' }

    subject(:update_subscription) do
      request.headers.merge!({ 'token' => token })
      put :update, params: { status: status }
    end

    it 'calls add_to_list' do
      update_subscription

      expect(newsletter_client).to have_received(:add_to_list).once
    end

    it 'updates flag' do
      expect { update_subscription }.to change { user.reload.newsletter }.from(false).to(true)
    end

    context 'when status is unsubscribe' do
      let(:status) { 'unsubscribe' }
      let(:newsletter) { true }

      it 'calls remove_from_list' do
        update_subscription

        expect(newsletter_client).to have_received(:remove_from_list).once
      end

      it 'updates flag' do
        expect { update_subscription }.to change { user.reload.newsletter }.from(true).to(false)
      end
    end
  end
end

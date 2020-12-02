# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#short_token' do
    let!(:user) { User.create!(email: 'test@test.com', token: 'abc123456', verified: true) }
    let!(:user_token) { UserToken.create!(user_id: user.id) }

    context 'when user token exists and is valid' do
      it 'returns token' do
        expect(user.short_token).to eq(user_token)
      end
    end

    context 'when user token exists but is invalid' do
      before do
        user_token.expire!
      end

      it 'creates new token' do
        expect { user.short_token }.to change { user.user_tokens.count }.from(1).to(2)
      end
    end

    context 'when user token does not exist' do
      before do
        user.user_tokens.destroy_all
      end

      it 'creates new token' do
        expect { user.short_token }.to change { user.user_tokens.count }.from(0).to(1)
      end
    end
  end
end

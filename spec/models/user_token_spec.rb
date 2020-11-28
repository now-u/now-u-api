# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserToken, type: :model do
  describe '#expire!' do
    let(:user) { User.create(email: 'test@test.com', token: 'abc123456', verified: true) }
    let(:user_token) { UserToken.create(user_id: user.id) }

    it 'sets expires_at to the past' do
      expect { user_token.expire! }.to change { user_token.reload.expires_at < Time.current }.from(false).to(true)
    end
  end

  describe '#expired?' do
    let(:user) { User.create(email: 'test@test.com', token: 'abc123456', verified: true) }
    let(:user_token) { UserToken.create(user_id: user.id) }

    it 'returns false after creating token' do
      expect(user_token.expired?).to eq false
    end

    context 'when expires_at is in the past' do
      before do
        user_token.update!(expires_at: Time.current - 1.day)
      end

      it 'returns true' do
        expect(user_token.expired?).to eq true
      end
    end
  end
end

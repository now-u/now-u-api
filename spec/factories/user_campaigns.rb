# frozen_string_literal: true

FactoryBot.define do
  factory :user_campaign do
    user_id { create(:user).id }
    campaign_id { create(:campaign).id }
    progress { 0 }
  end
end
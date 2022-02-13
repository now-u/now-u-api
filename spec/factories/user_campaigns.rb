# frozen_string_literal: true

FactoryBot.define do
  factory :user_campaign do
    progress { 0 }
    association :user
    association :campaign, :with_campaign_actions
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :campaign_goal do
    association :campaign, :with_campaign_actions
    association :goal
  end
end

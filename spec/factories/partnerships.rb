# frozen_string_literal: true

FactoryBot.define do
  factory :partnership do
    type { Faker::Marketing.buzzwords }
    association :campaign, :with_campaign_actions
    association :organisation
  end
end

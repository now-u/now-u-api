# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    title { Faker::Marketing.buzzwords }
    description { Faker::Lorem.sentence }
    link { Faker::Internet.url }
    association :campaign, :with_campaign_actions
    association :campaign_action
  end
end

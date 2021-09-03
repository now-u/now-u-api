# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    title { Faker::Marketing.buzzwords }
    description { Faker::Lorem.sentence }
    link { Faker::Internet.url }
    campaign_id { create(:campaign).id }
    campaign_action_id { create(:campaign_action).id }
  end
end
# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    title { Faker::Marketing.buzzwords }
    description { Faker::Lorem.sentence }
    link { Faker::Internet.url }
    campaign_id { create(:campaign).id }
    action_id { create(:action).id }
  end
end
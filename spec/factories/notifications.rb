# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    title { Faker::Marketing.buzzwords }
    subtitle { Faker::Marketing.buzzwords }
    body { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    image { Faker::Internet.url }
  end
end
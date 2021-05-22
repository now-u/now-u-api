# frozen_string_literal: true

FactoryBot.define do
  factory :quiz do
    title { Faker::Marketing.buzzwords }
    description { Faker::Lorem.sentence }
  end
end
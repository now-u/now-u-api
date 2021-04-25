# frozen_string_literal: true

FactoryBot.define do
  factory :press_coverage_article do
    title { Faker::Marketing.buzzwords }
    image_url { Faker::Internet.url }
    link { Faker::Internet.url }
    media_name { Faker::Marketing.buzzwords }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :campaign do
    title { Faker::Marketing.buzzwords }
    description_app  { Faker::Lorem.sentence }
    header_image { Faker::Internet.url }
    video_link { Faker::Internet.url }
    description_web { nil }
    enabled { true }
    start_date { Faker::Date.in_date_period }
    end_date { Faker::Date.in_date_period }
    short_name { Faker::Hipster.sentence }
    infographic_url { Faker::Internet.url }
  end
end
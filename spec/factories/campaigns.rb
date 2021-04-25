FactoryBot.define do
  factory :campaign do
    title { Faker::Marketing.buzzwords }
    description_app  { Faker::Lorem.sentence }
    header_image { nil }
    created_at { Faker::Date.in_date_period }
    updated_at { Faker::Date.in_date_period }
    video_link { nil }
    description_web { nil }
    enabled { true }
    start_date { Faker::Date.in_date_period }
    end_date { Faker::Date.in_date_period }
    short_name { Faker::Hipster.sentence }
    infographic_url { nil }
  end
end
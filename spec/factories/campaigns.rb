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
    of_the_month { false }
    recommended { false }

    trait :with_causes do
      causes { [association(:cause, :with_cause_action)] }
    end

    trait :with_campaign_actions do
      campaign_actions { [association(:campaign_action)] }
    end
  end
end

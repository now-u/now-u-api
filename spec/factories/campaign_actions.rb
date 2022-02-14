# frozen_string_literal: true

FactoryBot.define do
  factory :campaign_action do
    title { Faker::Marketing.buzzwords }
    link  { Faker::Internet.url }
    type { nil }
    what_description { Faker::Lorem.sentence }
    why_description { Faker::Lorem.sentence }
    time { 0.1 }
    enabled { true }
    release_date { Faker::Date.in_date_period }
    end_date { Faker::Date.in_date_period }
    of_the_month { false }
    recommended { false }

    association :campaign

    trait :with_cause_action do
      cause_actions { [association(:cause_action)] }
    end
  end
end

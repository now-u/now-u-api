# frozen_string_literal: true

FactoryBot.define do
  factory :blog_article do
    title { Faker::Marketing.buzzwords }
    subtitle  { Faker::Lorem.sentence }
    reading_time { Faker::Number.number(digits: [1, 2].sample) }
    enabled { true }
    header_image { Faker::Internet.url }
    tags { [] }

    association :campaign_action
    association :user
    association :campaign, :with_campaign_actions
  end
end

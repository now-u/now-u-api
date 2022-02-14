# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Marketing.buzzwords }
    body { Faker::Lorem.sentence }
    header_image { Faker::Internet.url }
    full_article_link { Faker::Internet.url }
    video_link { Faker::Internet.url }
    video_of_the_day { nil }
    subtitle { Faker::Marketing.buzzwords }
    link_text { Faker::Internet.url }
    source { Faker::Internet.url }
    enabled { true }
    release_date { Faker::Date.in_date_period }

    association :campaign_action
    association :campaign, :with_campaign_actions
  end
end

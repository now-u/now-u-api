# frozen_string_literal: true

FactoryBot.define do
  factory :blog_article do
    title { Faker::Marketing.buzzwords }
    subtitle  { Faker::Lorem.sentence }
    campaign_action_id { create(:campaign_action).id }
    user_id { User.first&.id || create(:user).id }
    campaign_id { create(:campaign).id }
    reading_time { Faker::Number.number(digits: [1, 2].sample) }
    enabled { true }
    header_image { Faker::Internet.url }
    tags { [] }
  end
end
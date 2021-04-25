FactoryBot.define do
  factory :blog_article do
    title { Faker::Marketing.buzzwords }
    subtitle  { Faker::Lorem.sentence }
    action_id { create(:action).id }
    user_id { User.first&.id || create(:user).id }
    campaign_id { create(:campaign).id }
    reading_time { nil }
    enabled { true }
    header_image { nil }
    tags { [] }
    created_at { Faker::Date.in_date_period }
    updated_at { Faker::Date.in_date_period }
  end
end
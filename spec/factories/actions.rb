FactoryBot.define do
  factory :action do
    title { Faker::Marketing.buzzwords }
    link  { nil }
    type { nil }
    campaign_id { create(:campaign).id }
    created_at { Faker::Date.in_date_period }
    updated_at { Faker::Date.in_date_period }
    what_description { nil }
    why_description { nil }
    time { true }
    enabled { true }
    release_date { Faker::Date.in_date_period }
    end_date { Faker::Date.in_date_period }
  end
end
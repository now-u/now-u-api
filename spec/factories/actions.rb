FactoryBot.define do
  factory :action do
    title { "Raising awareness on plastic pollution" }
    link  { "A detailed description on raising awareness" }
    type { nil }
    campaign_id { create(:campaign).id }
    created_at { Time.now }
    updated_at { Time.now }
    what_description { nil }
    why_description { nil }
    time { true }
    enabled { true }
    release_date { Time.now }
    end_date { Time.now }
  end
end
FactoryBot.define do
  factory :campaign do
    title { "Raising awareness on plastic pollution" }
    description_app  { "A detailed description on raising awareness" }
    header_image { nil }
    created_at { Time.now }
    updated_at { Time.now }
    video_link { nil }
    description_web { nil }
    enabled { true }
    start_date { Time.now }
    end_date { Time.now }
    short_name { 'Plastic Pollution' }
    infographic_url { nil }
  end
end
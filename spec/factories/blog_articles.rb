FactoryBot.define do
  factory :blog_article do
    title { "A blog title" }
    subtitle  { "A blog subtitle" }
    action_id { create(:action).id }
    user_id { User.first&.id || create(:user).id }
    campaign_id { create(:campaign).id }
    reading_time { nil }
    enabled { true }
    header_image { nil }
    tags { [] }
    # created_at { Time.now }
    # updated_at { "2021-04-25T12:29:12.068Z" }
  end
end
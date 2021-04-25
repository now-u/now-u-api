FactoryBot.define do
  factory :user do
    email { "example@example.com" }
    token { SecureRandom.hex(3) }
    verified { true }
    created_at { Time.now }
    updated_at { Time.now }
    full_name { "John Smith" }
    location { "London" }
    date_of_birth { nil }
    monthly_donation_limit { nil }
    home_owner { true }
    points { 1 }
    organisation_id { 1 }
    profile_picture_url { nil }
    description { nil }
    newsletter { false }
    user_role_id { 1 }
  end
end
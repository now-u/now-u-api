FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    token { SecureRandom.hex(3) }
    verified { true }
    created_at { Faker::Date.in_date_period }
    updated_at { Faker::Date.in_date_period }
    full_name { Faker::Name.name }
    location { Faker::Nation.capital_city }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    monthly_donation_limit { nil }
    home_owner { true }
    points { 0 }
    organisation_id { 1 }
    profile_picture_url { nil }
    description { nil }
    newsletter { false }
    user_role_id { 1 }
  end
end
# frozen_string_literal: true

FactoryBot.define do
  factory :organisation do
    name { Faker::Marketing.buzzwords }
    description { Faker::Lorem.sentence }
    logo_link { Faker::Internet.url }
    email { Faker::Internet.email }
    website { Faker::Internet.url }
    IG_link { Faker::Internet.url }
    FB_link { Faker::Internet.url }
    twitter_link { Faker::Internet.url }
    extra_text_1 { Faker::Lorem.sentence }
    extra_text_2 { nil }
    extra_text_3 { nil }
    extra_link_1 { Faker::Internet.url }
    extra_link_2 { nil }
    extra_link_3 { nil }
    organisation_type { nil }
    code { nil }
    geographic_reach { nil }
  end
end
# frozen_string_literal: true

FactoryBot.define do
  factory :learning_resource do
    title { Faker::Marketing.buzzwords }
    time  { 0.1 }
    link { Faker::Internet.url }
    type { nil }
    source { nil }
    release_date { Faker::Date.in_date_period }
    end_date { Faker::Date.in_date_period }
    association :learning_topic

    after :create do |learning_resource|
      learning_resource.causes << create(:cause)
    end
  end
end

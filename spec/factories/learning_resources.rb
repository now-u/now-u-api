# frozen_string_literal: true

FactoryBot.define do
  factory :learning_resource do
    title { Faker::Marketing.buzzwords }
    time  { 0.1 }
    link { Faker::Internet.url }
    type { nil }
    learning_topic_id { create(:learning_topic).id }
    source { nil }
    release_date { Faker::Date.in_date_period }
    end_date { Faker::Date.in_date_period }
  end
end
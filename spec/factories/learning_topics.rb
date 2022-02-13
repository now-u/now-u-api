# frozen_string_literal: true

FactoryBot.define do
  factory :learning_topic do
    title { Faker::Marketing.buzzwords }
    image_link { Faker::Internet.url }
    our_answer { nil }
    association :campaign
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :faq do
    question { Faker::Marketing.buzzwords }
    answer { Faker::Marketing.buzzwords }
  end
end
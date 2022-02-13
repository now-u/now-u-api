# frozen_string_literal: true

FactoryBot.define do
  factory :quiz_question do
    question { Faker::Marketing.buzzwords }
    association :quiz
  end
end

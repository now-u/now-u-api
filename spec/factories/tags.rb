# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    tag { Faker::Marketing.buzzwords }
  end
end
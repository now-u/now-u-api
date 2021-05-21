# frozen_string_literal: true

FactoryBot.define do
  factory :goal do
    title { "#{Faker::Verb.simple_present} #{Faker::Beer.brand}" }
    type { Faker::Dessert.variety }
  end
end

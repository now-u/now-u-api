# frozen_string_literal: true

FactoryBot.define do
  factory :cause do
    image { Faker::Internet.url }
    icon { Faker::Internet.url }
    name { Faker::Marketing.buzzwords }
    description { Faker::Lorem.sentence }
    joiners { Faker::Number.number(digits: [1, 2].sample) }

    trait :with_cause_action do
      cause_actions { [association(:cause_action)] }
    end
  end
end

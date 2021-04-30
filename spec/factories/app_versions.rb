# frozen_string_literal: true

FactoryBot.define do
  factory :app_version do
    version_number { Faker::Number.between(from: 1.0, to: 1.5) }
    compatible_with_current_api { [true, false].sample }
    release_notes { Faker::Marketing.buzzwords }
  end
end
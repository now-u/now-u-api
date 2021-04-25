# frozen_string_literal: true

FactoryBot.define do
  factory :cause_campaign do
    association :cause
    association :campaign
  end
end

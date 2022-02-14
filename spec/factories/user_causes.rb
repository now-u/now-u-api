# frozen_string_literal: true

FactoryBot.define do
  factory :user_cause do
    association :user
    association :cause, :with_cause_action
  end
end

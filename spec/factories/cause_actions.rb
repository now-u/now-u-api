# frozen_string_literal: true

FactoryBot.define do
  factory :cause_action do
    association :cause
    association :action
  end
end

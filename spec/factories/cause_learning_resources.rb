# frozen_string_literal: true

FactoryBot.define do
  factory :cause_learning_resource do
    association :cause
    association :learning_resource
  end
end

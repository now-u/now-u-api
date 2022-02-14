# frozen_string_literal: true

FactoryBot.define do
  factory :user_learning_resource do
    association :user
    association :learning_resource
  end
end

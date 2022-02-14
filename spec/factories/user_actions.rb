# frozen_string_literal: true

FactoryBot.define do
  factory :user_action do
    status { nil }
    comment { nil }
    association :user
    association :campaign_action
  end
end

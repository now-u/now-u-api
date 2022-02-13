# frozen_string_literal: true

FactoryBot.define do
  factory :cause_campaign do
    association :cause, :with_cause_action
    association :campaign, :with_campaign_actions
  end
end

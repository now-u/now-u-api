# frozen_string_literal: true

FactoryBot.define do
  factory :user_action do
    user_id { create(:user).id }
    campaign_action_id { create(:campaign_action).id }
    status { nil }
    comment { nil }
  end
end
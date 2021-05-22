# frozen_string_literal: true

FactoryBot.define do
  factory :campaign_goal do
    campaign_id { create(:campaign).id }
    goal_id { create(:goal).id }
  end
end
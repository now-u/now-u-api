# frozen_string_literal: true

FactoryBot.define do
  factory :user_action do
    user_id { create(:user).id }
    action_id { create(:action).id }
    status { nil }
    comment { nil }
  end
end
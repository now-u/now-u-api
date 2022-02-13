# frozen_string_literal: true

FactoryBot.define do
  factory :user_notification do
    user_id { create(:user).id }
    notification_id { create(:notification).id }
    dismissed { false }
  end
end

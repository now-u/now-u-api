# frozen_string_literal: true

FactoryBot.define do
  factory :user_cause do
    user_id { create(:user).id }
    cause_id { create(:cause).id }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :user_learning_resource do
    user_id { create(:user).id }
    learning_resource_id { create(:learning_resource).id }
  end
end
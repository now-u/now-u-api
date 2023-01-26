# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { "password" }
    admin_role { 64 }
  end
end

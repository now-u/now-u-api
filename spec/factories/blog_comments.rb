# frozen_string_literal: true

FactoryBot.define do
  factory :blog_comment do
    content { Faker::Lorem.sentence }
    user_id { create(:user).id }
    association :blog_article
  end
end

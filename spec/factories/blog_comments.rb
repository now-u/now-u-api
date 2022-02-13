# frozen_string_literal: true

FactoryBot.define do
  factory :blog_comment do
    content { Faker::Lorem.sentence }
    association :user
    association :blog_article
  end
end

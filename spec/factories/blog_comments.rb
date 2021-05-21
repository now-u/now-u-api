# frozen_string_literal: true

FactoryBot.define do
  factory :blog_comment do
    content { Faker::Lorem.sentence }
    user_id { create(:user).id }
    blog_article_id { create(:blog_article).id }
  end
end
# frozen_string_literal: true

FactoryBot.define do
  factory :blog_tag do
    tag_id { create(:tag).id }
    blog_article_id { create(:blog_article).id }
  end
end
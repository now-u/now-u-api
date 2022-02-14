# frozen_string_literal: true

FactoryBot.define do
  factory :blog_tag do
    association :tag
    association :blog_article
  end
end

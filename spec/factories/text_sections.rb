# frozen_string_literal: true

FactoryBot.define do
  factory :text_section do
    content { Faker::Lorem.sentence }
    blog_article_id { create(:blog_article).id }
    appearance_order { Faker::Number.number(digits: 1) }
    section_type { Faker::Marketing.buzzwords }
    title { Faker::Marketing.buzzwords }
  end
end
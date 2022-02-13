# frozen_string_literal: true

FactoryBot.define do
  factory :image_section do
    img_url { Faker::Internet.url }
    appearance_order { Faker::Number.number(digits: 1) }
    section_type { Faker::Marketing.buzzwords }
    
    association :blog_article
  end
end

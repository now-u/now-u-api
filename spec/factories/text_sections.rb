# frozen_string_literal: true

FactoryBot.define do
  factory :text_section do
    content { Faker::Lorem.sentence }
    appearance_order { Faker::Number.number(digits: 1) }
    section_type { Faker::Marketing.buzzwords }
    title { Faker::Marketing.buzzwords }

    association :blog_article
  end
end

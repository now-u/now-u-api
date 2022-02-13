# frozen_string_literal: true

FactoryBot.define do
  factory :quiz_answer do
    answer_image_url { Faker::Internet.url }
    answer_text { Faker::Lorem.sentence }
    is_correct { false }
    quiz_question_id { create(:quiz_question).id }
  end
end

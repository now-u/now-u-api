class QuizQuestion < ApplicationRecord
  has_many :quiz_answers
  belongs_to :quiz
end

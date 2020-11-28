# frozen_string_literal: true

class QuizQuestion < ApplicationRecord
  has_many :quiz_answers
  belongs_to :quiz, optional: true
end

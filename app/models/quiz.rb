# frozen_string_literal: true

class Quiz < ApplicationRecord
  has_many :quiz_questions
end

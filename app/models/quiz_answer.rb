# frozen_string_literal: true

class QuizAnswer < ApplicationRecord
  belongs_to :quiz_answer, optional: true
end

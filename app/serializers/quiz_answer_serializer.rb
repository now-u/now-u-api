# frozen_string_literal: true

class QuizAnswerSerializer < ActiveModel::Serializer
  attributes :id, :answer_image_url, :answer_text, :is_correct
end

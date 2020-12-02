# frozen_string_literal: true

class QuizSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :questions

  def questions
    ActiveModel::Serializer::CollectionSerializer.new(object.quiz_questions, serializer: QuizQuestionSerializer).as_json
  end
end

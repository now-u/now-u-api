class QuizSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :questions

  def questions
    ActiveModel::Serializer::CollectionSerializer.new(self.object.quiz_questions, serializer: QuizQuestionSerializer).as_json
  end
end

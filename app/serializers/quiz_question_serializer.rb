class QuizQuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :answers

  def answers
    ActiveModel::Serializer::CollectionSerializer.new(self.object.quiz_answers, serializer: QuizAnswerSerializer).as_json
  end
end

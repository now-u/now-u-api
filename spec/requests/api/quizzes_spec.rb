require 'swagger_helper'

RSpec.describe Api::V1::QuizController, type: :request do
  let(:quiz) { create(:quiz) }
  let(:id) { quiz.id }
  quiz_schema = Quiz.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: Quiz.column_for_attribute(column_name).type}
          res
  }

  before do
    quiz
  end

  path '/api/v1/quizzes' do
    get 'Retrieves all quizzes' do
      tags 'Quizzes'
      produces 'application/json'

      response '200', 'quizzes found' do
        schema type: :object,
        properties: quiz_schema

        before do |example|
          quiz
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end

  path '/api/v1/quizzes/{id}' do
    get 'Retrieves a quiz' do
      tags 'Quizzes'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'quiz found' do
        schema type: :object,
        properties: quiz_schema

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end

      response '404', 'Not found' do
        let(:id) { "something_invalid" }
        run_test!
      end
    end
  end
end

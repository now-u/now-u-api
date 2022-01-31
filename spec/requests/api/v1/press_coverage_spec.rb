require 'swagger_helper'

RSpec.describe Api::V1::PressCoverageArticlesController, type: :request do
  let(:press_coverage_article) { create(:press_coverage_article) }
  let(:id) { press_coverage_article.id }
  press_coverage_schema = PressCoverageArticle.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: PressCoverageArticle.column_for_attribute(column_name).type}
          res
  }

  before do
    press_coverage_article
  end

  path '/api/v1/press_coverage' do
    get 'Retrieves all press_coverage' do
      tags 'API::V1 -> Press coverage'
      produces 'application/json'

      response '200', 'press_coverage found' do
        schema type: :object,
        properties: press_coverage_schema

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end

  path '/api/v1/press_coverage/{id}' do
    get 'Retrieves a press_coverage' do
      tags 'API::V1 -> Press coverage'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'press_coverage found' do
        schema type: :object,
        properties: press_coverage_schema

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

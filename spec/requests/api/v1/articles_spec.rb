require 'swagger_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  let(:article) { create(:article) }
  let(:id) { article.id }
  article_schema = Article.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: Article.column_for_attribute(column_name).type}
          res
  }

  before do
    article
  end

  path '/api/v1/articles' do
    get 'Retrieves all articles' do
      tags 'API::V1 -> Articles'
      produces 'application/json'

      response '200', 'articles found' do
        schema type: :object,
        properties: article_schema

        before do |example|
          article
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end

  path '/api/v1/articles/{id}' do
    get 'Retrieves a article' do
      tags 'API::V1 -> Articles'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'article found' do
        schema type: :object,
        properties: article_schema

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

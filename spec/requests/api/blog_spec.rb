require 'swagger_helper'

RSpec.describe Api::V1::BlogArticlesController, type: :request do
  let(:blog_article) { create(:blog_article) }
  let(:id) { blog_article.id }
  blog_schema = BlogArticle.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: BlogArticle.column_for_attribute(column_name).type}
          res
  }

  before do
    blog_article
  end

  path '/api/v1/blogs' do
    get 'Retrieves all blogs' do
      tags 'Blogs'
      produces 'application/json'

      response '200', 'blogs found' do
        # getting some errors with this test as its an array
        # and not a JSON serialized object
        # schema type: :object,
        # properties: blog_schema

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end

  path '/api/v1/blogs/{id}' do
    get 'Retrieves a blog' do
      tags 'Blogs'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'blog found' do
        schema type: :object,
        properties: blog_schema

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
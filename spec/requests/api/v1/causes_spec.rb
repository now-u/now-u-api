require 'swagger_helper'

RSpec.describe Api::V1::CausesController, type: :request do
  let(:cause) { create(:cause) }
  let(:campaign) { create(:campaign) }
  let(:id) { cause.id }
  cause_schema = Cause.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: Cause.column_for_attribute(column_name).type}
          res
  }

  before do
    cause
    campaign
  end

  path '/api/v1/causes' do
    get 'Retrieves all causes' do
      tags 'API::V1 -> Causes'
      produces 'application/json'

      response '200', 'causes found' do
        schema type: :object,
        properties: cause_schema

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end

  path '/api/v1/causes/{id}' do
    get 'Retrieves a cause' do
      tags 'API::V1 -> Causes'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'cause found' do
        schema type: :object,
        properties: cause_schema

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

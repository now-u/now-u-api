require 'swagger_helper'

RSpec.describe Api::V2::CausesController, type: :request do
  let(:user) { create(:user) }
  let(:cause) { create(:cause) }
  let(:id) { cause.id }
  cause_schema = Cause.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: Cause.column_for_attribute(column_name).type}
          res
  }

  before do
    cause
  end

  path '/api/v2/causes' do
    get "If no user token header present, returns joined: 'User not authenticated'" do
      tags 'API::V2(latest) -> Causes'
      produces 'application/json'
      
      response '200', 'Cause found!' do
        schema type: :object,
        properties: cause_schema

        before do |example|
          cause
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end

    get 'Retrieves all Causes. If user token header present, returns with a joined: null/joined param.' do
      tags 'API::V2(latest) -> Causes'
      produces 'application/json'
      let(:'token') { user.token }
      
      response '200', 'Cause found' do
        schema type: :object,
        properties: cause_schema
        parameter name: 'token', :in => :header, :type => :string

        before do |example|
          cause
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end
end
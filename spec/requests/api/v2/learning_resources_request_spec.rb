require 'swagger_helper'

RSpec.describe Api::V2::LearningResourcesController, type: :request do
  let(:user) { create(:user) }
  let(:cause) { create(:cause) }
  let(:cause_id) { cause.id }
  let(:learning_resource) { create(:learning_resource, causes: [cause]) }
  let(:id) { learning_resource.id }
  learning_resource_schema = LearningResource.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: LearningResource.column_for_attribute(column_name).type}
          res
  }

  before do
    learning_resource
  end

  path '/api/v2/learning_resources' do
    get "If no user token header present, returns completed: 'Authentication failed'" do
      tags 'API::V2(latest) -> Learning Resource'
      produces 'application/json'
      
      response '200', 'Learning Resource found!' do
        schema type: :object,
        properties: learning_resource_schema

        before do |example|
          learning_resource
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'returns "Authentication failed"' do
          expect(JSON(response.body)['data'][0]['completed']).to eq 'Authentication failed'
        end
      end
    end

    get 'Retrieves all Learning Resources. If user token header present, returns with a completed: null/completed param.' do
      tags 'API::V2(latest) -> Learning Resources'
      produces 'application/json'
      let(:'token') { user.token }
      
      response '200', 'Learning Resource found!' do
        schema type: :object,
        properties: learning_resource_schema
        parameter name: 'token', :in => :header, :type => :string

        before do |example|
          learning_resource
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'returns completed: null' do
          expect(JSON(response.body)['data'][0]['completed']).to eq nil
        end
      end
    end
  end

  path '/api/v2/learning_resources/{id}' do
    get 'Getting a specific learning_resource' do
      tags 'API::V2(latest) -> Learning Resource'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      let(:'token') { user.token }
      
      response '200', 'Learning Resource found! (with user header)' do
        schema type: :object,
        properties: learning_resource_schema
        parameter name: 'token', :in => :header, :type => :string

        before do |example|
          learning_resource
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'returns if the user has completed the learning_resource' do
          expect(JSON(response.body)['data']['completed']).to eq nil
        end
      end
    end
  end

  path '/api/v2/learning_resources?cause__in=[{cause_id}]' do
    get "Filters learning_resources by cause id's" do
      tags 'API::V2(latest) -> Learning Resources'
      produces 'application/json'
      
      let(:cause_id) { cause.id }
      response '200', 'Learning Resource found!' do
        schema type: :object,
        properties: learning_resource_schema
        parameter name: :cause_id, in: :path, type: :string

        before do |example|
          learning_resource
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'returns an array of length 1' do
          expect(JSON(response.body)['data'].length).to eq 1
        end
      end
    end

    get "Filters learning_resources by cause id's" do
      tags 'API::V2(latest) -> Learning Resources'
      produces 'application/json'
      
      response '200', 'Learning Resource found!' do
        schema type: :object,
        properties: learning_resource_schema
        parameter name: :cause_id, in: :path, type: :string

        before do |example|
          learning_resource
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'returns an array of length 1' do
          expect(JSON(response.body)['data'].length).to eq 1
        end
      end
    end
  end
end

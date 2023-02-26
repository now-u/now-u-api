require 'swagger_helper'

describe Api::V2::CausesController, type: :request do
  let(:user) { create(:user) }
  let(:cause) { create(:cause) }
  let(:id) { cause.id }

  before do
    cause
  end

  path '/api/v2/causes' do
    get "If no user token header present, returns joined: false" do
      tags 'API::V2(latest) -> Causes'
      produces 'application/json'
      
      response '200', 'Cause found!' do
        schema api_response("cause", true) 

        run_test! do |response| 
          data = JSON.parse(response.body)
          expect(data['data'][0]['joined']).to eq false
        end
      end
    end

    get 'Retrieves all Causes. If user token header present, returns with joined: true/false.' do
      tags 'API::V2(latest) -> Causes'
      produces 'application/json'
      let(:'Authorization') { create_jwt_header(user) }
      
      response '200', 'Cause found' do
        schema api_response("cause", true) 
        parameter name: 'Authorization', :in => :header, :type => :string

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end

      context "user has joined the cause" do
        before do |example|
          user.causes << cause
          submit_request(example.metadata)
        end

        it 'returns true if the user has joined the cause' do
          expect(JSON(response.body)['data'][-1]['joined']).to eq true
        end
      end

      context "user has not joined the cause" do
        before do |example|
          submit_request(example.metadata)
        end

        it 'returns false if the user has not joined the cause' do
          expect(JSON(response.body)['data'][-1]['joined']).to eq false
        end
      end

      context "there is no authentication" do
        let(:'Authorization') { nil }

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns false if the there is no authentication' do
          expect(JSON(response.body)['data'][-1]['joined']).to eq false 
        end
      end
    end
  end

  path '/api/v2/causes/{id}' do
    get "If no user token header present, returns joined: false" do
      tags 'API::V2(latest) -> Causes'
      produces 'application/json'
      
      response '200', 'Cause found!' do
        schema api_response("cause")
        parameter name: :id, in: :path, type: :string

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end

    get 'Retrieves cause from cause id. If user token header present, returns with joined: true/false.' do
      tags 'API::V2(latest) -> Causes'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      let(:'Authorization') { create_jwt_header(user) }
      
      response '200', 'Cause found' do
        schema api_response("cause")
        parameter name: 'Authorization', :in => :header, :type => :string

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end

      context "user has joined the cause" do
        before do |example|
          user.causes << cause
          submit_request(example.metadata)
        end

        it 'returns true if the user has joined the cause' do
          expect(JSON(response.body)['data']['joined']).to eq true
        end
      end

      context "user has not joined the cause" do
        before do |example|
          submit_request(example.metadata)
        end

        it 'returns false if the user has not joined the cause' do
          expect(JSON(response.body)['data']['joined']).to eq false
        end
      end

      context "there is no authentication" do
        let(:'Authorization') { nil }

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns false if the there is no authentication' do
          expect(JSON(response.body)['data']['joined']).to eq false 
        end
      end
    end
  end
end

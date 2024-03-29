require 'swagger_helper'

RSpec.describe Api::V2::UserActionsController, type: :request do
  let!(:user) { create(:user) }
  let!(:user_action) { create(:user_action, user_id: user.id) }
  let!(:id) { user_action.id }
  user_action_schema = UserAction.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: UserAction.column_for_attribute(column_name).type}
          res
  }

  path '/api/v2/user/actions' do
    get 'Retrieves all actions from said user' do
      tags 'API::V2(latest) -> User Actions'
      produces 'application/json'
      let!(:'Authorization') { create_jwt_header(user) }
      
      response '200', 'User actions found' do
        schema type: :object,
        properties: user_action_schema
        parameter name: 'Authorization', :in => :header, :type => :string

        before do |example|
          user_action
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end

    get 'Retrieves all actions from said user' do
      tags 'API::V2(latest) -> User Actions'
      produces 'application/json'
      let(:'Authorization') { 'I can haz cheesburger' }
      
      response '401', 'User not authenticated' do
        schema type: :object,
        properties: user_action_schema
        parameter name: 'Authorization', :in => :header, :type => :string

        before do |example|
          user_action
          submit_request(example.metadata)
        end

        it 'returns a valid 401 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'returns a valid json' do |example|
          expect(JSON(response.body)['message']).to eq "User authorization failed"
        end
      end
    end
  end

  path '/api/v2/user/actions/{id}' do
    get 'Getting a specific user action' do
      tags 'API::V2(latest) -> User Actions'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      let(:'Authorization') { create_jwt_header(user) }
      
      response '200', 'User action found!' do
        schema type: :object,
        properties: user_action_schema
        parameter name: 'Authorization', :in => :header, :type => :string

        before do |example|
          user_action
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end
end

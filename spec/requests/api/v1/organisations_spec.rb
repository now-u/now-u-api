require 'swagger_helper'

RSpec.describe Api::V1::OrganisationsController, type: :request do
  # TODO Create a campaign which this organisation links to/ remove campaigns
  # from organisations
  let(:organisation) { create(:organisation) }
  let(:id) { organisation.id }

  before do
    organisation
  end

  path '/api/v1/organisations' do
    get 'Retrieves all organisations' do
      tags 'API::V1 -> Organisations'
      produces 'application/json'

      response '200', 'organisations found' do
        schema api_response('list_organisation', true)

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end

  path '/api/v1/organisations/{id}' do
    get 'Retrieves a organisation' do
      tags 'API::V1 -> Organisations'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'organisation found' do
        schema api_response('organisation')

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

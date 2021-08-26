require 'swagger_helper'

RSpec.describe Api::V1::CampaignsController, type: :request do
  let(:campaign) { create(:campaign) }
  let(:id) { campaign.id }
  campaign_schema = Campaign.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: Campaign.column_for_attribute(column_name).type}
          res
  }

  path '/api/v1/campaigns' do
    get 'Retrieves all Campaigns' do
      tags 'Campaigns'
      produces 'application/json'

      response '200', 'Campaigns found' do
        schema type: :object,
        properties: campaign_schema

        before do |example|
          campaign
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end

  path '/api/v1/campaigns/{id}' do
    get 'Retrieves a Campaign' do
      tags 'Campaigns'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Campaign found' do
        schema type: :object,
        properties: campaign_schema

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end
end

require 'swagger_helper'

RSpec.describe Api::V2::CampaignsController, type: :request do
  let(:user) { create(:user) }
  let(:campaign) { create(:campaign) }
  let(:id) { campaign.id }
  campaign_schema = Campaign.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: Campaign.column_for_attribute(column_name).type}
          res
  }

  before do
    campaign
  end

  path '/api/v2/campaigns' do
    get "If no user token header present, returns completed: 'Authentication failed'" do
      tags 'API::V2(latest) -> Campaigns'
      produces 'application/json'
      
      response '200', 'Campaign found!' do
        schema type: :object,
        properties: campaign_schema

        before do |example|
          campaign
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

    get 'Retrieves all Campaigns. If user token header present, returns with a completed: null/completed param.' do
      tags 'API::V2(latest) -> Campaigns'
      produces 'application/json'
      let(:'token') { user.token }
      
      response '200', 'Campaign found' do
        schema type: :object,
        properties: campaign_schema
        parameter name: 'token', :in => :header, :type => :string

        before do |example|
          campaign
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

  path '/api/v2/campaigns/{id}' do
    get 'Getting a specific campaign' do
      tags 'API::V2(latest) -> Campaigns'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      let(:'token') { user.token }
      
      response '200', 'Campaign found! (with user header)' do
        schema type: :object,
        properties: campaign_schema
        parameter name: 'token', :in => :header, :type => :string

        before do |example|
          campaign
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'returns if the user has completed the campaign' do
          expect(JSON(response.body)['data']['completed']).to eq nil
        end
      end
    end
  end
end
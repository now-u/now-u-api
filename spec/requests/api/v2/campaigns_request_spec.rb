require 'swagger_helper'

RSpec.describe Api::V2::CampaignsController, type: :request do
  let(:user) { create(:user) }
  let(:cause) { create(:cause) }
  let(:cause_id) { cause.id }
  let(:campaign) { create(:campaign, causes: [cause]) }
  let(:id) { campaign.id }
  campaign_schema = Campaign.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: Campaign.column_for_attribute(column_name).type}
          res
  }

  before do
    campaign
  end

  path '/api/v2/campaigns' do
    get "If no user token header present, returns completed: false" do
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
          expect(JSON(response.body)['data'][0]['completed']).to eq false 
        end
      end
    end

    get 'Retrieves all Campaigns. If user token header present, returns with a completed: true/false param.' do
      tags 'API::V2(latest) -> Campaigns'
      produces 'application/json'
      let(:'Authorization') { create_jwt_header(user) }
      
      response '200', 'Campaign found' do
        schema type: :object,
        properties: campaign_schema
        parameter name: 'Authorization', :in => :header, :type => :string

        context "user has not completed the campaign" do
          before do |example|
            campaign
            submit_request(example.metadata)
          end
  
          it 'returns a valid 200 response' do |example|
            assert_response_matches_metadata(example.metadata)
          end

          it 'returns completed: false' do
            expect(JSON(response.body)['data'][0]['completed']).to eq false
          end
        end

        context "user has completed the resource" do
          before do |example|
            user.campaigns << campaign
            submit_request(example.metadata)
          end

          it 'returns true if the user has completed the campaign' do
            expect(JSON(response.body)['data'][-1]['completed']).to eq true
          end
        end
      end
    end
  end

  path '/api/v2/campaigns/{id}' do
    get 'Getting a specific campaign' do
      tags 'API::V2(latest) -> Campaigns'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      let(:'Authorization') { create_jwt_header(user) }
      
      response '200', 'Campaign found! (with user header)' do
        schema type: :object,
        properties: campaign_schema
        parameter name: 'Authorization', :in => :header, :type => :string

        before do |example|
          campaign
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'returns if the user has completed the campaign' do
          expect(JSON(response.body)['data']['completed']).to eq false
        end
      end
    end
  end

  path '/api/v2/campaigns?cause__in=[{cause_id}]' do
    get "Filters campaigns by cause id's" do
      tags 'API::V2(latest) -> Campaigns'
      produces 'application/json'
      
      let(:cause_id) { '1' }
      response '200', 'Campaign found!' do
        schema type: :object,
        properties: campaign_schema
        parameter name: :cause_id, in: :path, type: :string

        before do |example|
          campaign
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'returns an array of length 0' do
          expect(JSON(response.body)['data'].length).to eq 0
        end
      end
    end

    get "Filters campaigns by cause id's" do
      tags 'API::V2(latest) -> Campaigns'
      produces 'application/json'
      
      response '200', 'Campaign found!' do
        schema type: :object,
        properties: campaign_schema
        parameter name: :cause_id, in: :path, type: :string

        before do |example|
          campaign
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

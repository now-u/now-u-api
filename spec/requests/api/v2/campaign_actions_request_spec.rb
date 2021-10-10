require 'swagger_helper'

RSpec.describe Api::V2::CampaignActionsController, type: :request do
  let(:user) { create(:user) }
  let(:cause) { create(:cause) }
  let(:cause_id) { cause.id }
  let(:campaign_action) { create(:campaign_action, causes: [cause]) }
  let(:id) { campaign_action.id }
  campaign_action_schema = CampaignAction.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: CampaignAction.column_for_attribute(column_name).type}
          res
  }

  before do
    campaign_action
  end

  path '/api/v2/actions' do
    get 'Retrieves all Campaign Actions. If user token header present, with a completed: null/completed param' do
      tags 'API::V2(latest) -> Actions'
      produces 'application/json'
      let(:'token') { user.token }
      
      response '200', 'Campaign actions found' do
        schema type: :object,
        properties: campaign_action_schema
        parameter name: 'token', :in => :header, :type => :string

        before do |example|
          campaign_action
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end

    get "If no user token header present, completed: 'User not authenticated'" do
      tags 'API::V2(latest) -> Actions'
      produces 'application/json'
      
      response '200', 'Campaign Actions found!' do
        schema type: :object,
        properties: campaign_action_schema

        before do |example|
          campaign_action
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end

  path '/api/v2/actions?cause__in=[{cause_id}]' do
    get "Filters campaign actions by cause id's" do
      tags 'API::V2(latest) -> Actions'
      produces 'application/json'
      
      let(:cause_id) { '1' }
      response '200', 'Actions found!' do
        schema type: :object,
        properties: campaign_action_schema
        parameter name: :cause_id, in: :path, type: :string

        before do |example|
          campaign_action
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

    get "Filters campaign actions by cause id's" do
      tags 'API::V2(latest) -> Actions'
      produces 'application/json'
      
      response '200', 'Campaign Action found!' do
        schema type: :object,
        properties: campaign_action_schema
        parameter name: :cause_id, in: :path, type: :string

        before do |example|
          campaign_action
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

  path '/api/v2/actions/{id}' do
    get 'Getting a specific action' do
      tags 'API::V2(latest) -> Actions'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      let(:'token') { user.token }
      
      response '200', 'Campaign Action found! (with user header)' do
        schema type: :object,
        properties: campaign_action_schema
        parameter name: 'token', :in => :header, :type => :string

        before do |example|
          campaign_action
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end
end

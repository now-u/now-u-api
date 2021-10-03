require 'swagger_helper'

RSpec.describe Api::V2::UserCampaignsController, type: :request do
  let(:user) { create(:user) }
  let(:user_campaign) { create(:user_campaign, user_id: user.id) }
  let(:id) { user_campaign.id }
  user_campaign_schema = UserCampaign.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: UserCampaign.column_for_attribute(column_name).type}
          res
  }

  before do
    user_campaign
  end

  path '/api/v2/user/campaigns' do
    get 'Retrieves all campaigns from said user when including User in header' do
      tags 'API::V2(latest) -> User Campaigns'
      produces 'application/json'
      let(:'token') { user.token }
      
      response '200', 'User campaigns found' do
        schema type: :object,
        properties: user_campaign_schema
        parameter name: 'token', :in => :header, :type => :string

        before do |example|
          user_campaign
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end

    get 'Not including the correct header' do
      tags 'API::V2(latest) -> User Campaigns'
      produces 'application/json'
      let(:'token') { 'I can haz cheesburger' }
      
      response '401', 'User not authenticated' do
        schema type: :object,
        properties: user_campaign_schema
        parameter name: 'token', :in => :header, :type => :string

        before do |example|
          user_campaign
          submit_request(example.metadata)
        end

        it 'returns a valid 401 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end

  path '/api/v2/user/campaigns/{id}' do
    get 'Getting a specific user action' do
      tags 'API::V2(latest) -> User Campaigns'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      let(:'token') { user.token }
      
      response '200', 'User campaign found!' do
        schema type: :object,
        properties: user_campaign_schema
        parameter name: 'token', :in => :header, :type => :string

        before do |example|
          user_campaign
          submit_request(example.metadata)
        end

        it 'returns a valid 200 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end
end
require 'swagger_helper'

RSpec.describe Api::V1::CampaignsController, type: :request do
  let(:campaign) { create(:campaign) }
  let(:campaign_id) { campaign.id }
  let(:action) { create(:action, campaign_id: campaign_id) }
  let(:action_id) { action.id }
  let(:article) { create(:article, action_id: action_id) }
  let(:offer) { create(:offer, action_id: action_id) }

  campaign_schema = Campaign.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: Campaign.column_for_attribute(column_name).type}
          res
  }

  action_schema = Action.column_names.reduce({}) { |res, column_name|
    res[column_name.to_sym] = {type: Action.column_for_attribute(column_name).type}
    res
  }

  article_schema = Article.column_names.reduce({}) { |res, column_name|
    res[column_name.to_sym] = {type: Article.column_for_attribute(column_name).type}
    res
  }

  offer_schema = Offer.column_names.reduce({}) { |res, column_name|
    res[column_name.to_sym] = {type: Offer.column_for_attribute(column_name).type}
    res
  }

  before do
    campaign
    
  end

  path '/api/v1/campaigns' do
    get 'Retrieves all Campaigns' do
      tags 'Campaigns'
      produces 'application/json'

      response '200', 'Campaigns found' do
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

  path '/api/v1/campaigns/{campaign_id}' do
    get 'Retrieves a Campaign' do
      tags 'Campaigns'
      produces 'application/json'
      parameter name: :campaign_id, in: :path, type: :string

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

      response '404', 'Not found' do
        let(:campaign_id) { "something_invalid" }
        run_test!
      end
    end
  end

  path '/api/v1/campaigns/{campaign_id}/actions' do
    get 'Retrieves a Campaigns actions' do
      tags 'Campaigns'
      produces 'application/json'
      parameter name: :campaign_id, in: :path, type: :string

      response '200', 'Campaigns actions found' do
        schema type: :object,
        properties: action_schema

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end

      response '404', 'Not found' do
        let(:campaign_id) { "something_invalid" }
        run_test!
      end
    end
  end

  path '/api/v1/campaigns/{campaign_id}/actions/{action_id}' do
    get 'Retrieves a Campaigns action through action id' do
      tags 'Campaigns'
      produces 'application/json'
      parameter name: :campaign_id, in: :path, type: :string
      parameter name: :action_id, in: :path, type: :string

      response '200', 'Campaign found' do
        schema type: :object,
        properties: action_schema

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end

      response '404', 'Not found' do
        let(:campaign_id) { "something_invalid" }
        let(:action_id) { "something_invalid" }
        run_test!
      end
    end
  end

  path '/api/v1/campaigns/{campaign_id}/actions/{action_id}/articles' do
    get 'Retrieves a Campaigns articles through action id' do
      tags 'Campaigns'
      produces 'application/json'
      parameter name: :campaign_id, in: :path, type: :string
      parameter name: :action_id, in: :path, type: :string

      response '200', 'Campaign found' do
        schema type: :object,
        properties: article_schema

        before do |example|
          article
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end

        it 'has articles in its body' do
          data = JSON(response.body)["data"]
          expect(data.first["title"]).to eq article.title
        end
      end

      response '404', 'Not found' do
        let(:campaign_id) { "something_invalid" }
        let(:action_id) { "something_invalid" }
        run_test!
      end
    end
  end

  path '/api/v1/campaigns/{campaign_id}/actions/{action_id}/offers' do
    get 'Retrieves a Campaigns offers through action id' do
      tags 'Campaigns'
      produces 'application/json'
      parameter name: :campaign_id, in: :path, type: :string
      parameter name: :action_id, in: :path, type: :string

      response '200', 'Campaign found' do
        schema type: :object,
        properties: offer_schema

        before do |example|
          article
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end

      response '404', 'Not found' do
        let(:campaign_id) { "something_invalid" }
        let(:action_id) { "something_invalid" }
        run_test!
      end
    end
  end

  path '/api/v1/campaigns/{campaign_id}/articles' do
    get 'Retrieves a Campaigns articles' do
      tags 'Campaigns'
      produces 'application/json'
      parameter name: :campaign_id, in: :path, type: :string
      parameter name: :action_id, in: :path, type: :string

      response '200', 'Campaign found' do
        schema type: :object,
        properties: article_schema

        before do |example|
          article
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end

      response '404', 'Not found' do
        let(:campaign_id) { "something_invalid" }
        let(:action_id) { "something_invalid" }
        run_test!
      end
    end
  end

  path '/api/v1/campaigns/{campaign_id}/offers' do
    get 'Retrieves a Campaigns articles' do
      tags 'Campaigns'
      produces 'application/json'
      parameter name: :campaign_id, in: :path, type: :string
      parameter name: :action_id, in: :path, type: :string

      response '200', 'Campaign found' do
        schema type: :object,
        properties: offer_schema

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end

      response '404', 'Not found' do
        let(:campaign_id) { "something_invalid" }
        let(:action_id) { "something_invalid" }
        run_test!
      end
    end
  end

  path '/api/v1/campaigns/{campaign_id}/learning_topics' do
    get 'Retrieves a Campaigns learning topics' do
      tags 'Campaigns'
      produces 'application/json'
      parameter name: :campaign_id, in: :path, type: :string
      parameter name: :action_id, in: :path, type: :string

      response '200', 'Campaign found' do
        schema type: :object,
        properties: offer_schema

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end

      response '404', 'Not found' do
        let(:campaign_id) { "something_invalid" }
        let(:action_id) { "something_invalid" }
        run_test!
      end
    end
  end
end

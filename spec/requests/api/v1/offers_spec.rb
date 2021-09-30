require 'swagger_helper'

RSpec.describe Api::V1::OffersController, type: :request do
  let(:offer) { create(:offer) }
  let(:id) { offer.id }
  offer_schema = Offer.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: Offer.column_for_attribute(column_name).type}
          res
  }

  path '/api/v1/offers' do
    get 'Retrieves all offers' do
      tags 'API::V1 -> Offers'
      produces 'application/json'

      response '200', 'offers found' do
        schema type: :object,
        properties: offer_schema

        before do |example|
          offer
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end

  path '/api/v1/offers/{id}' do
    get 'Retrieves a offer' do
      tags 'API::V1 -> Offers'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'offer found' do
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
        let(:id) { "something_invalid" }
        run_test!
      end
    end
  end
end
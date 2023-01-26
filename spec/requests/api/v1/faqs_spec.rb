require 'swagger_helper'

RSpec.describe Api::V1::FaqsController, type: :request do
  let(:faq) { create(:faq) }

  before do
    faq
  end

  path '/api/v1/faqs' do
    get 'Retrieves all faqs' do
      tags 'API::V1 -> Frequently Asked Questions'
      produces 'application/json'

      response '200', 'faqs found' do
        schema api_response("faq", true)

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

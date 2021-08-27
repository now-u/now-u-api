require 'swagger_helper'

RSpec.describe Api::V1::FaqsController, type: :request do
  let(:faq) { create(:faq) }
  let(:id) { offer.id }
  faq_schema = Faq.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: Faq.column_for_attribute(column_name).type}
          res
  }

  path '/api/v1/faqs' do
    get 'Retrieves all faqs' do
      tags 'Frequently Asked Questions'
      produces 'application/json'

      response '200', 'faqs found' do
        schema type: :object,
        properties: faq_schema

        before do |example|
          faq
          submit_request(example.metadata)
        end

        it 'returns a valid 201 response' do |example|
          assert_response_matches_metadata(example.metadata)
        end
      end
    end
  end
end
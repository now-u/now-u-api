require 'swagger_helper'

RSpec.describe Api::V2::UserCausesController, type: :request do
  let(:user) { create(:user) }
  let!(:cause) { create(:cause) }
  let!(:cause1) { create(:cause) }
  let!(:cause_ids) { [cause.id, cause1.id] }
  user_cause_schema = UserCause.column_names.reduce({}) { |res, column_name|
          res[column_name.to_sym] = {type: Cause.column_for_attribute(column_name).type}
          res
  }

  # before do
  #   cause
  # end

  # path '/api/v2/me/causes' do
  #   post "Join causes that are passed in through an array of cause_ids. Will need user token header" do
  #     tags 'API::V2(latest) -> Causes'
  #     produces 'application/json'
  #     let(:'token') { user.token }
      
  #     response '200', 'Causes joined' do
  #       schema type: :object,
  #       properties: user_cause_schema
  #       parameter name: 'token', :in => :header, :type => :string
  #       parameter name: 'cause_ids', :in => :query

  #       before do |example|
  #         submit_request(example.metadata)
  #       end

  #       it 'returns a valid 200 response' do |example|
  #         assert_response_matches_metadata(example.metadata)
  #       end
  #     end
  #   end
  # end
end

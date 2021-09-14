require 'rails_helper'
require 'swagger_helper'

RSpec.describe "Causes", type: :request do
  let(:cause) { create(:cause) }

  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/causes"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/causes/#{cause.id}"
      expect(response).to have_http_status(:success)
      expect(JSON(response.body)["id"]).to eq cause.id
    end
  end
end

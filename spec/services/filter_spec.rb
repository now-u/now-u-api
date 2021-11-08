require 'rails_helper'

RSpec.describe V2::Filters::Filter, type: :model do
  let(:request_url) { "https://ilovecats.com/bigkahunaburger?completed=true" }
  let(:headers) { {'token': "123456"} }
  let(:request) { OpenStruct.new(headers: headers, url: request_url) }
  let(:filter_model) { nil }

  subject { described_class.new(request: request, filter_model: filter_model, data: "I am the fallback data") }

  it "seperates the query params out of the URL" do
    expect(subject.query_params).to eq({"completed" => "true"})
  end

  context "with campaign actions filter module" do
    let(:filter_model) { V2::Filters::CampaignActionFilter }
    let(:campaign_action) { create(:campaign_action) }
    let(:campaign_action1) { create(:campaign_action) }
    let(:campaign_action2) { create(:campaign_action) }

    before do
      campaign_action
      campaign_action1
      campaign_action2
    end

    context "with a filter that exists" do
      let(:request_url) { "https://ilovecats.com/bigkahunaburger?limit=2" }

      it "calls the limit onto the model" do
        expect(subject.call.length).to eq 2
      end
    end

    context "with a filter that doesnt exist" do
      let(:request_url) { "https://ilovecats.com/bigkahunaburger?catsrule=true" }

      it "returns nothing" do
        expect { subject.call }.to raise_error "Invalid filter 'catsrule' for model CampaignAction"
      end
    end
  end

  context "when there are no filters" do
    let(:request_url) { "https://icanhazcheezeburger.com/doublewhopperplease" }
    it "returns the fallback data" do
      expect(subject.call).to eq "I am the fallback data"
    end
  end
end

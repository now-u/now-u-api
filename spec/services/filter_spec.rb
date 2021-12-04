require 'rails_helper'

RSpec.describe V2::Filters::Filter, type: :model do
  let!(:request_url) { "https://ilovecats.com/bigkahunaburger?completed=true" }
  let!(:headers) { {'token' => nil} }
  let!(:request) { OpenStruct.new(headers: headers, url: request_url) }
  let!(:filter_model) { V2::Filters::CampaignActionFilter }
  let!(:campaign_action) { create(:campaign_action, of_the_month: true, recommended: false) }
  let!(:campaign_action1) { create(:campaign_action, of_the_month: true, recommended: true) }
  let!(:campaign_action2) { create(:campaign_action, of_the_month: true, recommended: false) }
  let!(:campaign_action3) { create(:campaign_action, of_the_month: true, recommended: true) }
  let!(:user) { create(:user, campaign_actions: [campaign_action, campaign_action3]) }

  subject { described_class.new(request: request, filter_model: filter_model, data: CampaignAction.all) }

  context "with campaign actions filter module" do
    context "with a filter that exists" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?limit=2" }

      it "calls the limit onto the model" do
        expect(subject.call.length).to eq 2
      end
    end

    context "with a filter that doesnt exist" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?catsrule=true" }

      it "returns nothing" do
        expect { subject.call }.to raise_error "Invalid filter 'catsrule' for model CampaignAction"
      end
    end
  end

  context "when there are no filters" do
    let!(:request_url) { "https://icanhazcheezeburger.com/doublewhopperplease" }
    it "returns the fallback data" do
      expect(subject.call).to eq CampaignAction.all
    end
  end

  context "with multiple filters" do
    let!(:request_url) { "https://ilovecats.com/bigkahunaburger?recommended=true&of_the_month=true" }

    it "filters recursively through the filter set" do
      expect(subject.call.length).to eq 2
      expect(subject.call).to eq [campaign_action1, campaign_action3]
    end
  end

  context "with a user header" do
    let!(:headers) { {'token' => user.token} }

    context "with a single user specific filter" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?joined=true" }

      it "filters through user attributes" do
        expect(subject.call.length).to eq 2
        expect(subject.call).to eq [campaign_action, campaign_action3]
      end
    end

    context "with multiple filters, mix of user-specific and model specific" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?recommended=true&joined=true" }

      it "filters through user attributes" do
        expect(subject.call.length).to eq 1
        expect(subject.call).to eq [campaign_action3]
      end
    end
  end
end

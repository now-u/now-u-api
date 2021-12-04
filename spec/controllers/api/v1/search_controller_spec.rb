require 'rails_helper'

RSpec.describe Api::V1::SearchController, type: :controller do
    describe "#search" do
        let!(:campaign) { Campaign.create!(title: "test campaign")}
        let!(:campaign2) { Campaign.create!(title: "test", description_web: "campaign")}
        let!(:learning_topic) { LearningTopic.create!(title: "lt test", campaign: campaign)}
        let!(:learning_resource) { LearningResource.create!(title: "test lr", learning_topic: learning_topic)}
        let!(:learning_resource2) { LearningResource.create!(title: "test", type: "lr", learning_topic: learning_topic)}
        let!(:campaign_action) { CampaignAction.create!(title: "test action", campaign: campaign)}
        let!(:campaign_action2) { CampaignAction.create!(title: "test", type: "action", campaign: campaign)}

        it "should return only campaings" do
            get :index, params: { query: "campaign" }, as: :json

            result = JSON.parse(response.body)["result"]["campaigns"]
            expect(result.size).to eq(2)
        end

        it "should return only learnging resources" do
            get :index, params: { query: "lr" }, as: :json

            result = JSON.parse(response.body)["result"]["learning_resources"]
            expect(result.size).to eq(2)
        end

        it "should return only actions" do
            get :index, params: { query: "action" }, as: :json

            result = JSON.parse(response.body)["result"]["campaign_actions"]
            expect(result.size).to eq(2)
        end

        it "should return 2 each model" do
            get :index, params: { query: "test" }, as: :json
            campaigns = JSON.parse(response.body)["result"]["campaigns"]
            expect(campaigns.size).to eq(2)
            lrs = JSON.parse(response.body)["result"]["learning_resources"]
            expect(lrs.size).to eq(2)
            campaign_actions = JSON.parse(response.body)["result"]["campaign_actions"]
            expect(campaign_actions.size).to eq(2)
        end

        it "should return only campaings" do
            get :search, params: { model: "campaigns", query: "test" }, as: :json
            campaigns = JSON.parse(response.body)["result"]["campaigns"]
            expect(campaigns.size).to eq(2)
        end

        it "should return only learning resources" do
            get :search, params: { model: "learning_resources", query: "test" }, as: :json
            lrs = JSON.parse(response.body)["result"]["learning_resources"]
            expect(lrs.size).to eq(2)
        end

        it "should return only actions" do
            get :search, params: { model: "campaign_actions", query: "test" }, as: :json
            campaign_actions = JSON.parse(response.body)["result"]["campaign_actions"]
            expect(campaign_actions.size).to eq(2)
        end
    end
end

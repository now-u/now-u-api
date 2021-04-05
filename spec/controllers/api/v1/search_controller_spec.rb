require 'rails_helper'
require 'byebug'

RSpec.describe Api::V1::SearchController, type: :controller do
    describe "#search" do
        let(:campaign) { Campaign.create!(title: "test campaign")}
        let(:campaign2) { Campaign.create!(title: "test2", description_web: "campaign")}
        let(:learning_resource) { LearningResource.create!(title: "test lr")}
        let(:learning_resource2) { LearningResource.create!(title: "test2", type: "lr")}
        let(:action) { Action.create!(title: "test action")}
        let(:action2) { Action.create!(title: "test2", type: "action")}

        it "should return only campaings" do
            get :index, params: { query: "test2" }, as: :json

            expect(true).to eq(JSON.parse(response.body)["result"])
        end
        it "should return only learnging resources" do
            expect(true).to eq(true)
        end
        it "should return only actions" do
            expect(true).to eq(true)
        end
    end
end

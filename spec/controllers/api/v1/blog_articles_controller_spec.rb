require 'rails_helper'

RSpec.describe Api::V1::BlogArticlesController, type: :controller do
    describe "index" do
        let(:user) { User.create(email: 'ok@ok.com', token: 'abc1234', verified: true) }
        let(:campaign) { Campaign.create!(title: "test campaign")}
        let(:action) { Action.create!(title: "test action", campaign: campaign)}
        let(:first_blog_post) { BlogArticle.create!(title: "First", user: user, action: action, campaign: campaign, enabled: true )}
        let(:second_blog_post) { BlogArticle.create!(title: "Second", user: user, action: action, campaign: campaign, enabled: true )}
        before do
            first_blog_post
            second_blog_post
        end
        it "should be ordered desc by created_at attribute" do
            get :index
            expect(JSON.parse(response.body).first["id"]).to eq(second_blog_post.id)
        end
    end

end

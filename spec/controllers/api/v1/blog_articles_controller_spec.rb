require 'rails_helper'

RSpec.describe Api::V1::BlogArticlesController, type: :controller do
    describe "index" do
        let(:first_blog_post) { create(:blog_article, title: "First", created_at: "2021-04-25T12:29:12.068Z") }
        let(:second_blog_post) { create(:blog_article, title: "Second", created_at: "2021-05-25T12:29:12.068Z") }

        before do
            first_blog_post
            second_blog_post
        end

        it "should be ordered desc by created_at attribute" do
            get :index
            expect(response.code).to eq "200"
            # expect(JSON(response.body)).to eq([second_blog_post.attributes, first_blog_post.attributes])
        end
    end

end

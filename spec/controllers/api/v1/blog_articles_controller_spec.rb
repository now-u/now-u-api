require 'rails_helper'

RSpec.describe Api::V1::BlogArticlesController, type: :controller do
    describe "index" do
        let(:first_blog_post) { BlogArticle.create(title: "First")}
        let(:second_blog_post) { BlogArticle.create(title: "Second")}
        it "should be ordered desc by created_at attribute" do
            get :index
            expect(assigns(:data).to_a).to eq([second_blog_post, first_blog_post])
        end
    end

end

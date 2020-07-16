class Api::V1::BlogArticlesController < ApplicationController
  before_action :validate_token, only: [:create]
  
  def index
    render json: { data: BlogArticle.where(enabled: true) }, status: :ok
  end

  def create
    blog = BlogArticle.create!(
      title: params[:title],
      subtitle: params[:subtitle],
      action_id: params[:action_id].to_i,
      user_id: @user.id,
      campaign_id: params[:campaign_id].to_i,
      reading_time: params[:reading_time].to_i
    )
    params[:sections].each_with_index do | section, index |
      if section["type"] == 'image_section'
        ImageSection.create!(
          img_url: section["img_url"],
          blog_article_id: BlogArticle.last.id,
          appearance_order: index + 1
        )
      elsif section["type"] == 'text_section'
        TextSection.create!(
          content: section["content"],
          blog_article_id: BlogArticle.last.id,
          appearance_order: index + 1
        )
      end
    end
    response = { 'message' => 'Blog created' }

    render json: { data: response }, status: :ok
  end

  def show
    blog = BlogArticle.find(params[:id])
    sections = blog.text_sections + blog.image_sections
    sections = sections.sort_by{ | section | section.appearance_order }
    data = { blog: blog }
    sections
    data = data.to_json(
      include: [:tags, :user => {only: [:full_name, :description, :profile_picture_url]}]
    )
    data = {data: JSON.parse(data), sections: sections}
    render json: data, status: :ok
    
  end

  private

  def validate_token
    @user = User.find_by(token: params[:token])

    return if @user

    render json: {}, status: :unauthorized
  end
end

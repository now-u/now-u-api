# frozen_string_literal: true

class BlogArticle < ApplicationRecord
  include ::V2::Image::ImageService

  has_one_attached :header_image_s3

  belongs_to :user
  belongs_to :campaign_action
  belongs_to :campaign

  has_many :comments, dependent: :destroy, class_name: "BlogComment"
  has_many :text_sections, dependent: :destroy
  has_many :image_sections, dependent: :destroy
  has_many :blog_tags
  has_many :tags, through: :blog_tags

  def header_image
    if header_image_s3.attached?
      get_image_path(header_image_s3)
    else
      super
    end
  end
end

# frozen_string_literal: true

class ImageSection < ApplicationRecord
  include ::V2::Image::ImageService

  has_one_attached :img_s3

  belongs_to :blog_article

  def img_url
    if img_s3.attached?
      get_image_path(img_s3)
    else
      super
    end
  end
end

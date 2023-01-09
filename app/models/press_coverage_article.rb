# frozen_string_literal: true

class PressCoverageArticle < ApplicationRecord
  include ::V2::Image::ImageService

  has_one_attached :image_url_s3

  def image_url
    if image_url_s3.attached?
      get_image_path(image_url_s3)
    else
      super
    end
  end
end

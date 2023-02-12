# frozen_string_literal: true

class LearningTopic < ApplicationRecord
  include ::V2::Image::ImageService

  has_one_attached :image_link_s3

  belongs_to :campaign
  has_many :learning_resources

  def image_link
    if image_link_s3.attached?
      get_image_path(image_link_s3)
    else
      super
    end
  end
end

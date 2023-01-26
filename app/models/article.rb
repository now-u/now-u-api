# frozen_string_literal: true

class Article < ApplicationRecord
  include ::V2::Image::ImageService

  has_one_attached :header_image_s3

  belongs_to :campaign
  belongs_to :campaign_action

  scope :active, lambda {
    where('enabled IS TRUE AND release_date IS NULL').or(
      where('enabled IS TRUE AND ? > release_date', DateTime.now)
    )
  }

  def header_image
    if header_image_s3.attached?
      get_image_path(header_image_s3)
    else
      super
    end
  end
end

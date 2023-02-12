# frozen_string_literal: true

class Notification < ApplicationRecord
  include ::V2::Image::ImageService

  has_one_attached :image_s3

  def send_notification_to_all_users
    User.all.each do |user|
      user.notifications << self
    end
  end

  def image
    if image_s3.attached?
      get_image_path(image_s3)
    else
      super
    end
  end
end

# frozen_string_literal: true

class Cause < ApplicationRecord
  include ::V2::Image::ImageService

  has_one_attached :image_s3

  has_many :cause_actions, dependent: :destroy
  has_many :campaign_actions, through: :cause_actions

  has_many :cause_learning_resources, dependent: :destroy
  has_many :learning_resources, through: :cause_learning_resources

  has_many :cause_campaigns, dependent: :destroy
  has_many :campaigns, through: :cause_campaigns

  has_many :user_causes
  has_many :users, through: :user_causes

  def image
    if image_s3.attached?
      get_image_path(image_s3)
    else
      super
    end
  end
end

# frozen_string_literal: true

class QuizAnswer < ApplicationRecord
  include ::V2::Image::ImageService

  has_one_attached :answer_image_url_s3

  belongs_to :quiz_answer, optional: true

  def answer_image_url
    if answer_image_url_s3.attached?
      get_image_path(answer_image_url_s3)
    else
      super
    end
  end
end

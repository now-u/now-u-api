# frozen_string_literal: true

class BlogArticle < ApplicationRecord
  belongs_to :user
  belongs_to :action
  belongs_to :campaign

  has_many :comments, dependent: :destroy, class_name: "BlogComment"
  has_many :text_sections, dependent: :destroy
  has_many :image_sections, dependent: :destroy
  has_many :blog_tags
  has_many :tags, through: :blog_tags
end

# frozen_string_literal: true

class BlogTag < ApplicationRecord
  belongs_to :blog_article
  belongs_to :tag
end

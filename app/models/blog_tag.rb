class BlogTag < ApplicationRecord
  belongs_to :blog_article
  belongs_to :tag
end

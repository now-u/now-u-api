class Action < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :campaign
  has_many :articles
  has_many :offers
  has_many :blog_articles
end

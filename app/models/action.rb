class Action < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :campaign
  has_many :articles
  has_many :offers
  has_many :blog_articles

  default_scope { where('enabled IS TRUE AND release_date IS NULL').or(where('enabled IS TRUE AND ? > release_date', DateTime.now)) }
end

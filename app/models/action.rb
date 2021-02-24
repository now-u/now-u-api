# frozen_string_literal: true

class Action < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :campaign
  has_many :articles
  has_many :offers
  has_many :blog_articles
  has_and_belongs_to_many :causes, optional: true

  scope :active, lambda {
    where('enabled IS TRUE AND release_date IS NULL').or(
      where('enabled IS TRUE AND ? > release_date', DateTime.now)
    ).where('end_date IS NULL OR end_date > ?', DateTime.now)
  }
end

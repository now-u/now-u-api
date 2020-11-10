# frozen_string_literal: true

class Action < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :campaign
  has_many :articles
  has_many :offers
  has_many :blog_articles
  has_many :action_steps

  scope :active, lambda {
    where('enabled IS TRUE AND release_date IS NULL').or(
      where('enabled IS TRUE AND ? > release_date', DateTime.now)
    )
  }
end

# frozen_string_literal: true

class CampaignAction < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :campaign
  has_many :articles
  has_many :offers
  has_many :blog_articles

  include PgSearch::Model
  pg_search_scope :search, against: %i[title type what_description why_description]

  has_many :cause_actions, dependent: :destroy
  has_many :causes, through: :cause_actions

  scope :active, lambda {
    where('enabled IS TRUE AND release_date IS NULL').or(
      where('enabled IS TRUE AND ? > release_date', DateTime.now)
    ).where('end_date IS NULL OR end_date > ?', DateTime.now)
  }
end

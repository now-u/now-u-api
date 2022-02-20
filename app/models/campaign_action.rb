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

  scope :filter_by_cause, lambda { |cause_arr|
    joins(:causes).where(causes: { id: cause_arr })
  }

  scope :of_the_month, ->(bool) { where(of_the_month: bool) }

  scope :recommended, ->(bool) { where(recommended: bool) }

  scope :type, ->(type) { where(type: type) }

  scope :time_gte, ->(time) { where("time >= ?", time.to_i) }
  scope :time_lte, ->(time) { where("time <= ?", time.to_i) }
end

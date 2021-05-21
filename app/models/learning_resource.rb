# frozen_string_literal: true

class LearningResource < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :learning_topic

  include PgSearch::Model
  pg_search_scope :search, against: %i[title type]

  scope :active, lambda {
    where('release_date IS NULL OR ? > release_date', DateTime.now).where('end_date IS NULL OR end_date > ?', DateTime.now)
  }

  has_many :cause_learning_resources, dependent: :destroy
  has_many :causes, through: :cause_learning_resources
end

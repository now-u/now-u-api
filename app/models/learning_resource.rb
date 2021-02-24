# frozen_string_literal: true

class LearningResource < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :learning_topic
  has_and_belongs_to_many :causes, optional: true

  scope :active, lambda {
    where('release_date IS NULL OR ? > release_date', DateTime.now).where('end_date IS NULL OR end_date > ?', DateTime.now)
  }
end

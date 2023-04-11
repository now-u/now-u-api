# frozen_string_literal: true

class LearningResource < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :learning_topic, optional: true

  scope :active, lambda {
    where('release_date IS NULL OR ? > release_date', DateTime.now).where('end_date IS NULL OR end_date > ?', DateTime.now)
  }

  scope :filter_by_cause, lambda { |cause_arr|
    joins(:causes).where(causes: { id: cause_arr })
  }

  has_many :cause_learning_resources, dependent: :destroy
  has_many :causes, through: :cause_learning_resources

  scope :time_gte, ->(time) { where("time >= ?", time.to_i) }
  scope :time_lte, ->(time) { where("time <= ?", time.to_i) }
  
  # meilisearch do
  #   searchable_attribute [:title, :type, :source]
  # end
end

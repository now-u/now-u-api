# frozen_string_literal: true

class LearningTopic < ApplicationRecord
  belongs_to :campaign
  has_many :learning_resources
end

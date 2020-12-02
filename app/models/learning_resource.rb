# frozen_string_literal: true

class LearningResource < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :learning_topic
end

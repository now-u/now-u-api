# frozen_string_literal: true

class CauseLearningResource < ApplicationRecord
  belongs_to :learning_resource
  belongs_to :cause
end

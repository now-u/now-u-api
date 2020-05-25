class LearningTopic < ApplicationRecord
  belongs_to :campaign
  has_many :learning_resources
end

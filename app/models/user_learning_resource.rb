class UserLearningResource < ApplicationRecord
  belongs_to :user
  belongs_to :learning_resource
end

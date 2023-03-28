class CampaignLearningResource < ApplicationRecord
  belongs_to :campaign
  belongs_to :learning_resource
end

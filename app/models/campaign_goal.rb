class CampaignGoal < ApplicationRecord
  belongs_to :goal
  belongs_to :campaign
end

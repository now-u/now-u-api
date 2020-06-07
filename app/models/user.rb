class User < ApplicationRecord
  validates_uniqueness_of :email
  validates_uniqueness_of :token

  has_many :user_campaigns
  has_many :campaigns, :through => :user_campaigns

  has_many :user_actions
  has_many :actions, :through => :user_actions

  def selected_campaigns
    campaigns
  end

  def completed_campaigns
    Campaign.where(id: user_campaigns.where(progress: 100).pluck(:campaign_id))
  end

  def completed_actions
    Action.where(id: user_actions.where(status: 'completed').pluck(:action_id))
  end

  def rejected_actions
    Action.where(id: user_actions.where(status: 'rejected').pluck(:action_id))
  end
end

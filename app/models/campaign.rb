class Campaign < ApplicationRecord
  validates_presence_of :title

  has_many :actions
  has_many :articles
  has_many :offers
  has_many :partnerships
  has_many :learning_topics
  has_many :organisations, :through => :partnerships
  has_many :campaign_goals
  has_many :goals, :through => :campaign_goals

  def sdgs
    goals.where('type = ?', 'United Nations Sustainable Development Goal')
  end

  def general_partners
    organisations.where('partnerships.type = ?', 'general')
  end

  def campaign_partners
    organisations.where('partnerships.type = ?', 'campaign')
  end
end

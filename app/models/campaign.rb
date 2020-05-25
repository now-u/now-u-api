class Campaign < ApplicationRecord
  has_many :actions
  has_many :articles
  has_many :offers
  has_many :partnerships
  has_many :organisations, :through => :partnerships
  has_many :campaign_goals
  has_many :goals, :through => :campaign_goals
end

class User < ApplicationRecord
  validates_uniqueness_of :email
  validates_uniqueness_of :token

  has_many :user_campaigns
  has_many :campaigns, :through => :user_campaigns

  has_many :user_actions
  has_many :actions, :through => :user_actions
end

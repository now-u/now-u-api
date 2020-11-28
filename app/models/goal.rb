# frozen_string_literal: true

class Goal < ApplicationRecord
  self.inheritance_column = nil

  has_many :campaign_goals
  has_many :campaigns, through: :campaign_goals
end

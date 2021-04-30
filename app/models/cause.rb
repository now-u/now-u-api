# frozen_string_literal: true

class Cause < ApplicationRecord
  has_many :cause_actions, dependent: :destroy
  has_many :actions, through: :cause_actions

  has_many :cause_learning_resources, dependent: :destroy
  has_many :learning_resources, through: :cause_learning_resources

  has_many :cause_campaigns, dependent: :destroy
  has_many :campaigns, through: :cause_campaigns
end

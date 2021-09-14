# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :campaign
  belongs_to :campaign_action

  scope :active, lambda {
    where('enabled IS TRUE AND release_date IS NULL').or(
      where('enabled IS TRUE AND ? > release_date', DateTime.now)
    )
  }
end

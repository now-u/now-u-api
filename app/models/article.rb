class Article < ApplicationRecord
  belongs_to :campaign
  belongs_to :action

  scope :active, -> { where('enabled IS TRUE AND release_date IS NULL').or(where('enabled IS TRUE AND ? > release_date', DateTime.now)) }
end

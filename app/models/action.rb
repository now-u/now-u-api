class Action < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :campaign
  has_many :articles
end

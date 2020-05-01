class Campaign < ApplicationRecord
  has_many :actions
  has_many :articles
end

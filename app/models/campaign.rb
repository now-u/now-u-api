class Campaign < ApplicationRecord
  has_many :actions
  has_many :articles
  has_many :offers
end

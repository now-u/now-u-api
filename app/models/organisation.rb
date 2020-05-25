class Organisation < ApplicationRecord
  has_many :partnerships
  has_many :campaigns, :through => :partnerships
end

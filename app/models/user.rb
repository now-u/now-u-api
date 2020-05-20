class User < ApplicationRecord
  validates_uniqueness_of :email
  validates_uniqueness_of :token
end

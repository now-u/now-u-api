class Organisation < ApplicationRecord
  has_many :partnerships
  has_many :users
  has_many :campaigns, :through => :partnerships

  def create_organisation_code
    self.code = generateCode()
  end

  private
  
  def generateCode()
    SecureRandom.hex(8)
  end
end

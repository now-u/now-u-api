class Partnership < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :organisation
  belongs_to :campaign
end

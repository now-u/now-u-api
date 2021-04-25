class CauseAction < ApplicationRecord
  belongs_to :action
  belongs_to :cause
end

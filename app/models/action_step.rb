class ActionStep < ApplicationRecord
  # belongs_to :action, optional: true
  belongs_to :action
  has_many :action_step_options
end

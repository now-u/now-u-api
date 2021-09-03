# frozen_string_literal: true

class CauseAction < ApplicationRecord
  belongs_to :campaign_action
  belongs_to :cause
end

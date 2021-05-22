# frozen_string_literal: true

class CauseCampaign < ApplicationRecord
  belongs_to :campaign
  belongs_to :cause
end

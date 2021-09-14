# frozen_string_literal: true

class Offer < ApplicationRecord
  belongs_to :campaign
  belongs_to :campaign_action
end

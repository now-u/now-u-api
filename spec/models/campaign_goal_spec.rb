# frozen_string_literal: true

require 'rails_helper'

describe CampaignGoal do
  subject { build(:campaign_goal) }

  it { should be_valid }
end

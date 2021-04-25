# frozen_string_literal: true

require 'rails_helper'

describe CauseCampaign do
  subject { build(:cause_campaign) }

  describe "associations" do
    it { is_expected.to belong_to(:cause) }
    it { is_expected.to belong_to(:campaign) }
  end
end
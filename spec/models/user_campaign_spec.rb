# frozen_string_literal: true

require 'rails_helper'

describe UserCampaign do
  subject { create(:user_campaign) }

  it { should belong_to(:user) }
  it { should belong_to(:campaign) }
end

# frozen_string_literal: true

require 'rails_helper'

describe UserAction do
  subject { create(:user_action) }

  it { should belong_to(:user) }
  it { should belong_to(:campaign_action) }
end

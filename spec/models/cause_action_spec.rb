# frozen_string_literal: true

require 'rails_helper'

describe CauseAction do
  subject { build(:cause_action) }

  describe "associations" do
    it { is_expected.to belong_to(:cause) }
    it { is_expected.to belong_to(:action) }
  end
end

# frozen_string_literal: true

require 'rails_helper'

describe Campaign do
  subject { build(:campaign) }

  it { should be_valid }
end

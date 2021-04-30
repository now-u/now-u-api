# frozen_string_literal: true

require 'rails_helper'

describe Notification do
  subject { build(:notification) }

  it { should be_valid }
end

# frozen_string_literal: true

require 'rails_helper'

describe Goal do
  subject { build(:goal) }

  it { should be_valid }
end

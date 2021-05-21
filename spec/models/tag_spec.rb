# frozen_string_literal: true

require 'rails_helper'

describe Tag do
  subject { build(:tag) }

  it { should be_valid }
end

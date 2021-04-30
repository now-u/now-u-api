# frozen_string_literal: true

require 'rails_helper'

describe Partnership do
  subject { build(:partnership) }

  it { should be_valid }
end

# frozen_string_literal: true

require 'rails_helper'

describe Action do
  subject { build(:action) }

  it { should be_valid }
end

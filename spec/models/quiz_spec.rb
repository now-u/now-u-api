# frozen_string_literal: true

require 'rails_helper'

describe Quiz do
  subject { build(:quiz) }

  it { should be_valid }
end

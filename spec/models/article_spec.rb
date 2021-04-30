# frozen_string_literal: true

require 'rails_helper'

describe Article do
  subject { build(:article) }

  it { should be_valid }
end

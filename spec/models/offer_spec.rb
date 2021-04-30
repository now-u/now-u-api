# frozen_string_literal: true

require 'rails_helper'

describe Offer do
  subject { build(:offer) }

  it { should be_valid }
end

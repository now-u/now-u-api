# frozen_string_literal: true

require 'rails_helper'

describe Organisation do
  subject { build(:organisation) }

  it { should be_valid }
end

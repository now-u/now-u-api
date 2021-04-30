# frozen_string_literal: true

require 'rails_helper'

describe Faq do
  subject { build(:faq) }

  it { should be_valid }
end

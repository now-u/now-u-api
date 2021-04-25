# frozen_string_literal: true

require 'rails_helper'

describe Cause do
  subject { build(:cause) }

  describe "associations" do
    it { should have_many(:learning_resources) }
    it { should have_many(:actions) }
    it { should have_many(:campaigns) }
  end
end

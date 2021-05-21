# frozen_string_literal: true

require 'rails_helper'

describe CauseLearningResource do
  subject { build(:cause_learning_resource) }

  describe "associations" do
    it { is_expected.to belong_to(:cause) }
    it { is_expected.to belong_to(:learning_resource) }
  end
end
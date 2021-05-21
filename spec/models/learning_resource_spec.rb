# frozen_string_literal: true

require 'rails_helper'

describe LearningResource do
  subject { build(:learning_resource) }

  it { should be_valid }
end

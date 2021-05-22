# frozen_string_literal: true

require 'rails_helper'

describe LearningTopic do
  subject { build(:learning_topic) }

  it { should be_valid }
end

# frozen_string_literal: true

require 'rails_helper'

describe UserLearningResource do
  subject { create(:user_learning_resource) }

  it { should belong_to(:user) }
  it { should belong_to(:learning_resource) }
end

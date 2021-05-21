# frozen_string_literal: true

require 'rails_helper'

describe QuizAnswer do
  subject { build(:quiz_answer) }

  it { should be_valid }
end

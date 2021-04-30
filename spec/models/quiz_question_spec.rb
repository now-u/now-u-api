# frozen_string_literal: true

require 'rails_helper'

describe QuizQuestion do
  subject { build(:quiz_question) }

  it { should be_valid }
end

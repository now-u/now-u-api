# frozen_string_literal: true

require 'rails_helper'

describe UserCause do
  subject { create(:user_cause) }

  it { should belong_to(:user) }
  it { should belong_to(:cause) }
end

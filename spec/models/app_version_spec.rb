require 'rails_helper'

describe AppVersion do
  subject { build(:app_version) }

  it { should be_valid }
end

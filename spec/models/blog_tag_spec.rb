# frozen_string_literal: true

require 'rails_helper'

describe BlogTag do
  subject { build(:blog_tag) }

  it { should be_valid }
end

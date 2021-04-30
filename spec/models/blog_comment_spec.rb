# frozen_string_literal: true

require 'rails_helper'

describe BlogComment do
  subject { build(:blog_comment) }

  it { should be_valid }
end

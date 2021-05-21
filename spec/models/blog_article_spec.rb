# frozen_string_literal: true

require 'rails_helper'

describe BlogArticle do
  subject { build(:blog_article) }

  it { should be_valid }
end

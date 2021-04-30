# frozen_string_literal: true

require 'rails_helper'

describe TextSection do
  subject { build(:text_section) }

  context "when valid" do
    it { should be_valid }
  end

  context "when not valid" do
    subject { build(:text_section, blog_article_id: nil)}
    it { should_not be_valid }
  end
end

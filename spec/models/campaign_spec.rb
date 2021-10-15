# frozen_string_literal: true

require 'rails_helper'

describe Campaign do
  subject { build(:campaign) }

  it { should be_valid }

  before do
    3.times { create(:campaign) }
    2.times { create(:campaign, of_the_month: true) }
    1.times { create(:campaign, recommended: true) }
  end

  context "scopes" do
    describe "filter_by_cause" do
      it "takes an array of cause id's and returns associated records" do
        expect(described_class.filter_by_cause([1, 2])).to eq []
      end
    end

    describe "limit" do
      it "takes a limit and returns last n records" do
        expect(described_class.limit(2).length).to eq 2
      end
    end

    describe "of_the_month" do
      it "returns of_the_month featured actions" do
        expect(described_class.of_the_month(true).length).to eq 2
      end
    end

    describe "recommended" do
      it "returns recommended featured actions" do
        expect(described_class.recommended(true).length).to eq 1
      end
    end
  end
end

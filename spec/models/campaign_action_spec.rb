# frozen_string_literal: true

require 'rails_helper'

describe CampaignAction do
  subject { build(:campaign_action) }

  it { should be_valid }

  context "scopes" do
    describe "filter_by_cause" do
      it "takes an array of cause id's and returns associated records" do
        
      end
    end

    describe "limit" do
      it "takes a limit and returns last n records" do
        
      end
    end

    describe "of_the_month" do
      it "returns of_the_month featured actions" do
        
      end
    end

    describe "recommended" do
      it "returns recommended featured actions" do
        
      end
    end
  end
end

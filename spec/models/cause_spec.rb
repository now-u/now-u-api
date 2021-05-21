# frozen_string_literal: true

require 'rails_helper'

describe Cause do
  let(:campaign) { create(:campaign) } 
  let(:learning_resource) { create(:learning_resource) } 
  let(:action) { create(:action) } 
  subject { create(:cause) }

  describe "associations" do
    let(:associate_campaign) { subject.campaigns << campaign }
    let(:associate_learning_resources) { subject.learning_resources << learning_resource }
    let(:associate_actions) { subject.actions << action }

    it { should have_many(:learning_resources) }
    it { should have_many(:actions) }
    it { should have_many(:campaigns) }

    context "when creating" do
      it "can associate through join tables" do
        expect { associate_campaign }.to change { subject.campaigns.count }.from(0).to(1)
        expect { associate_learning_resources }.to change { subject.learning_resources.count }.from(0).to(1)
        expect { associate_actions }.to change { subject.actions.count }.from(0).to(1)
      end
    end

    context "when making duplicate associations" do
      before do
        associate_campaign
        associate_learning_resources
        associate_actions
      end
      
      it "will not make duplicates" do
        expect { associate_campaign }.not_to change { subject.campaigns.count }
        expect { associate_learning_resources }.not_to change { subject.learning_resources.count }
        expect { associate_actions }.not_to change { subject.actions.count }
      end
    end

    context "when deleting associated tables" do
      let(:delete_campaign) { campaign.destroy }
      let(:delete_learning_resource) { learning_resource.destroy }
      let(:delete_action) { action.destroy }

      before do
        associate_campaign
        associate_learning_resources
        associate_actions
      end

      it "will delete the join" do
        expect { delete_campaign }.to change { subject.campaigns.count }.from(1).to(0)
        expect { delete_learning_resource }.to change { subject.learning_resources.count }.from(1).to(0)
        expect { delete_action }.to change { subject.actions.count }.from(1).to(0)
      end
    end
  end
end

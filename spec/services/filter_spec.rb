require 'rails_helper'

RSpec.describe V2::Filters::Filter, type: :model do
  let!(:request_url) { "https://ilovecats.com/bigkahunaburger?completed=true" }
  let!(:headers) { {'token' => nil} }
  let!(:request) { OpenStruct.new(headers: headers, url: request_url) }
  subject { described_class.new(request: request, filter_model: filter_model, data: data_scope) }

  context "with campaign actions filter module" do
    let!(:filter_model) { V2::Filters::CampaignActionFilter }
    let!(:data_scope) { CampaignAction.all }
    let!(:campaign_action) { create(:campaign_action, of_the_month: true, recommended: false, time: 10.0) }
    let!(:campaign_action1) { create(:campaign_action, of_the_month: true, recommended: true, time: 5.0) }
    let!(:campaign_action2) { create(:campaign_action, of_the_month: true, recommended: false, time: 17.0) }
    let!(:campaign_action3) { create(:campaign_action, of_the_month: true, recommended: true, time: 3.0) }
    let!(:user) { create(:user, campaign_actions: [campaign_action, campaign_action3]) }

    context "with a filter that exists" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?limit=2" }

      it "calls the limit onto the model" do
        expect(subject.call.length).to eq 2
      end
    end

    context "with a filter that doesnt exist" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?catsrule=true" }

      it "returns nothing" do
        expect { subject.call }.to raise_error "Invalid filter 'catsrule' for model CampaignAction"
      end
    end

    context "when there are no filters" do
      let!(:request_url) { "https://icanhazcheezeburger.com/doublewhopperplease" }
      it "returns the fallback data" do
        expect(subject.call).to eq CampaignAction.all
      end
    end
  
    context "with multiple filters" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?recommended=true&of_the_month=true" }
  
      it "filters recursively through the filter set" do
        expect(subject.call.length).to eq 2
        expect(subject.call).to eq [campaign_action1, campaign_action3]
      end
    end
  
    context "with a user header" do
      let!(:headers) { {'token' => user.token} }
  
      context "with a single user specific filter" do
        context "joined filter" do
          let!(:request_url) { "https://ilovecats.com/bigkahunaburger?joined=true" }
  
          it "returns users joined campaign actions" do
            expect(subject.call.length).to eq 2
            expect(subject.call).to eq [campaign_action, campaign_action3]
          end
        end
  
        context "completed filter" do
          let!(:request_url) { "https://ilovecats.com/bigkahunaburger?completed=true" }

          before do
            user_action = UserAction.find_by(campaign_action_id: campaign_action.id)
            user_action.status = "completed"
            user_action.save!
          end
  
          it "returns users completed campaign actions" do
            expect(subject.call.length).to eq 1
            expect(subject.call).to eq [campaign_action]
          end
        end
      end
  
      context "with multiple filters, mix of user-specific and model specific" do
        let!(:request_url) { "https://ilovecats.com/bigkahunaburger?recommended=true&joined=true" }
  
        it "filters through user attributes" do
          expect(subject.call.length).to eq 1
          expect(subject.call).to eq [campaign_action3]
        end
      end

      context "time filter" do
        context "with the time_gte filter" do
          let!(:request_url) { "https://ilovecats.com/bigkahunaburger?time__gte=8" }

          it "returns the correct campaign actions based on the time greater than filter" do
            expect(subject.call.length).to eq 2
            expect(subject.call).to include(campaign_action, campaign_action2)
          end
        end
  
        context "with the time_lte filter" do
          let!(:request_url) { "https://ilovecats.com/bigkahunaburger?time__lte=8" }

          it "returns the correct campaign actions based on the time less than filter" do
            expect(subject.call).to include(campaign_action1, campaign_action3)
          end
        end

        context "with both the filters" do
          let!(:request_url) { "https://ilovecats.com/bigkahunaburger?time__gte=4&time__lte=11" }

          it "returns the correct campaign actions based on the time greater than and less than filter" do
            expect(subject.call.length).to eq 2
            expect(subject.call).to include(campaign_action, campaign_action1)
          end
        end
      end
    end
  end

  context "with campaigns filter module" do
    let!(:filter_model) { V2::Filters::CampaignFilter }
    let!(:data_scope) { Campaign.all }
    let!(:campaign) { create(:campaign, of_the_month: true, recommended: false) }
    let!(:campaign1) { create(:campaign, of_the_month: true, recommended: true) }
    let!(:campaign2) { create(:campaign, of_the_month: true, recommended: false) }
    let!(:campaign3) { create(:campaign, of_the_month: true, recommended: true) }
    let!(:user) { create(:user, campaigns: [campaign, campaign3]) }

    context "with a filter that exists" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?limit=2" }

      it "calls the limit onto the model" do
        expect(subject.call.length).to eq 2
      end
    end

    context "with a filter that doesnt exist" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?catsrule=true" }

      it "returns nothing" do
        expect { subject.call }.to raise_error "Invalid filter 'catsrule' for model Campaign"
      end
    end

    context "when there are no filters" do
      let!(:request_url) { "https://icanhazcheezeburger.com/doublewhopperplease" }
      it "returns the fallback data" do
        expect(subject.call).to eq Campaign.all
      end
    end
  
    context "with multiple filters" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?recommended=true&of_the_month=true" }
  
      it "filters recursively through the filter set" do
        expect(subject.call.length).to eq 2
        expect(subject.call).to eq [campaign1, campaign3]
      end
    end
  
    context "with a user header" do
      let!(:headers) { {'token' => user.token} }
  
      context "with a single user specific filter" do  
        context "completed filter" do
          let!(:request_url) { "https://ilovecats.com/bigkahunaburger?completed=true" }
          # create a new learning topic with the campaign
          let!(:learning_topic) { create(:learning_topic, campaign_id: campaign.id) }
          # create a new learning resource with the topic and the user
          let!(:learning_resource) { create(:learning_resource, learning_topic_id: learning_topic.id) }
          # create a new campaign action with the campaign and the user
          let!(:campaign_action) { create(:campaign_action, campaign_id: campaign.id) }
  
          before do
            user.campaign_actions << campaign_action
            user.learning_resources << learning_resource
          end

          it "returns users completed campaign actions" do
            expect(subject.call.length).to eq 1
            expect(subject.call).to eq [campaign]
          end
        end
      end
    end
  end

  context "with causes filter module" do
    let!(:filter_model) { V2::Filters::CauseFilter }
    let!(:data_scope) { Cause.all }
    let!(:cause) { create(:cause) }
    let!(:cause1) { create(:cause) }
    let!(:cause2) { create(:cause) }
    let!(:cause3) { create(:cause) }
    let!(:user) { create(:user, causes: [cause, cause3]) }

    context "with user filters" do
      let!(:headers) { {'token' => user.token} }

      context "with the joined filter" do
        let!(:request_url) { "https://ilovecats.com/bigkahunaburger?joined=true" }

        it "returns the causes that the user has joined" do
          expect(subject.call.length).to eq 2
          expect(subject.call).to eq [cause, cause3]
        end
      end
    end
  end

  context "with learning resource filter module" do
    let!(:filter_model) { V2::Filters::LearningResourceFilter }
    let!(:data_scope) { LearningResource.all }
    let!(:learning_resource) { create(:learning_resource, time: 10.0) }
    let!(:learning_resource1) { create(:learning_resource, time: 5.0) }
    let!(:learning_resource2) { create(:learning_resource, time: 17.0) }
    let!(:learning_resource3) { create(:learning_resource, time: 3.0) }
    let!(:user) { create(:user, learning_resources: [learning_resource1]) }

    context "with a filter that exists" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?limit=2" }

      it "calls the limit onto the model" do
        expect(subject.call.length).to eq 2
      end
    end

    context "with a filter that doesnt exist" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?catsrule=true" }

      it "returns nothing" do
        expect { subject.call }.to raise_error "Invalid filter 'catsrule' for model LearningResource"
      end
    end

    context "when there are no filters" do
      let!(:request_url) { "https://icanhazcheezeburger.com/doublewhopperplease" }
      it "returns the fallback data" do
        expect(subject.call).to eq LearningResource.all
      end
    end
  
    context "with multiple filters" do
      let!(:request_url) { "https://ilovecats.com/bigkahunaburger?cause__in=[#{learning_resource.causes.first.id},#{learning_resource1.causes.first.id}]&limit=2" }
  
      it "filters recursively through the filter set" do
        expect(subject.call.length).to eq 2
        expect(subject.call).to eq [learning_resource, learning_resource1]
      end
    end

    context "time filter" do
      context "with the time_gte filter" do
        let!(:request_url) { "https://ilovecats.com/bigkahunaburger?time__gte=8" }

        it "returns the correct learning resource based on the time greater than filter" do
          expect(subject.call.length).to eq 2
          expect(subject.call).to include(learning_resource, learning_resource2)
        end
      end

      context "with the time_lte filter" do
        let!(:request_url) { "https://ilovecats.com/bigkahunaburger?time__lte=8" }

        it "returns the correct learning resource based on the time less than filter" do
          expect(subject.call).to include(learning_resource1, learning_resource3)
        end
      end

      context "with both the filters" do
        let!(:request_url) { "https://ilovecats.com/bigkahunaburger?time__gte=4&time__lte=11" }

        it "returns the correct learning resource based on the time greater than and less than filter" do
          expect(subject.call.length).to eq 2
          expect(subject.call).to include(learning_resource, learning_resource1)
        end
      end
    end
  
    context "with a user header" do
      let!(:headers) { {'token' => user.token} }
  
      context "with a single user specific filter" do  
        context "completed filter" do
          let!(:request_url) { "https://ilovecats.com/bigkahunaburger?completed=true" }

          it "returns users completed campaign actions" do
            expect(subject.call.length).to eq 1
            expect(subject.call).to eq [learning_resource1]
          end
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Cause, type: :model do
  describe 'cause attributes' do
    let(:cause) { Cause.create!(image: "image.path", icon: "icon.path", name: "cause name", description: "cause description", number_joiners: 5)}
    it('should have an image') do
      expect(cause.image).to eq("image.path")
    end
    it('should have an icon') do
      expect(cause.icon).to eq("icon.path")
    end
    it('should have an image') do
      expect(cause.name).to eq("cause name")
    end
    it('should have an image') do
      expect(cause.description).to eq("cause description")
    end
    it('should have an image') do
      expect(cause.number_joiners).to eq(5)
    end
  end
  describe 'cause relationships' do
    let(:cause) { Cause.create!(image: "image.path", icon: "icon.path", name: "cause name", description: "cause description", number_joiners: 5)}
    let(:campaign) { Campaign.create!(title: "campaing")}
    let(:action) { Action.create!(campaign: campaign) }
    let(:learning_topic) { LearningTopic.create!(campaign: campaign)}
    let(:learning_resource) { LearningResource.create!(learning_topic: learning_topic)}
    it('should be able to have many actions') do
      cause.actions << action
      expect(cause.actions.size).to eq(1)
    end
    it('should be able to have many campaigns') do
      cause.campaigns << campaign
      expect(cause.campaigns.size).to eq(1)
    end
    it('should be able to have many learnging resources') do
      cause.learning_resources << learning_resource
      expect(cause.learning_resources.size).to eq(1)
    end
    it('should belong to many actions') do
      action.causes << cause
      expect(action.causes.first).to eq(cause)
    end
    it('should belong to many campaigns') do
      campaign.causes << cause
      expect(campaign.causes.first).to eq(cause)
    end
    it('should belong to many learnging resources') do
      learning_resource.causes << cause
      expect(learning_resource.causes.first).to eq(cause)
    end
  end
end

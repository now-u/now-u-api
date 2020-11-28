# frozen_string_literal: true

module Reports
  class CampaignReportHelpers
    def initialize(campaign_id)
      @campaign_id = campaign_id
    end

    def learning_resources_completed
      campaign = Campaign.find(@campaign_id)
      learning_topics = campaign.learning_topics
      campaign_learning_resource_reference = learning_topics.map(&:learning_resources).flatten.map { |x| [x.id, x.title] }.to_h
      campaign_learning_resource_ids = LearningResource.where(learning_topic_id: learning_topics.ids).ids
      campaign_learning_resource_counts = UserLearningResource.where(learning_resource_id: campaign_learning_resource_ids).pluck(:learning_resource_id).group_by(&:itself).transform_values(&:count)
      campaign_learning_resource_counts.map { |k, v| [campaign_learning_resource_reference[k], v] }.to_h
    end

    def number_of_campaign_supporters
      UserCampaign.where(campaign_id: @campaign_id).count
    end

    def number_of_campaign_partners; end

    def action_types
      UserAction.joins(:action).where('actions.campaign_id = ?', @campaign_id).where(status: 'completed').group(:type).count
    end

    def actions_completed
      UserAction.joins(:action).where('actions.campaign_id = ?', @campaign_id)
                .where(status: 'completed').count
    end

    def most_popular_action
      res = UserAction.joins(:action).where('actions.campaign_id = ?', @campaign_id)
                      .where(status: 'completed')
                      .group_by { |x| x.action.title }.map { |k, v| ["#{k} (#{v.size})", v.size] }

      return nil unless res.any?

      res.sort_by { |x| x[1] }.reverse.first[0]
    end
  end
end

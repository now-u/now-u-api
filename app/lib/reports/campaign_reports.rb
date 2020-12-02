# frozen_string_literal: true

module Reports
  class CampaignReports
    def initialize(args = {})
      @status = args[:status] || 'active'
    end

    def report
      result = { campaigns: {}, overall: {} }
      report = Reports::ReportHelpers.new

      result[:overall]['User count'] = User.count
      result[:overall]['Actions completed'] = UserAction.where(status: 'completed').count
      result[:overall]['Campaigns joined'] = UserCampaign.count
      result[:overall]['Campaigners (Users who support at least one campaign)'] = UserCampaign.all.pluck(:user_id).uniq.size
      result[:overall]['Users who have completed at least one action'] = UserAction.where(status: 'completed').pluck(:user_id).uniq.size
      result[:overall]['Average campaigns per user'] = report.campaigns_per_user
      result[:overall]['Average actions per user'] = report.actions_completed_per_user
      # result[:overall]['Top users (by actions completed)'] = report.top_users

      Campaign.send(@status).each do |campaign|
        result[:campaigns][campaign.title] = {}
        campaign_report = Reports::CampaignReportHelpers.new(campaign.id)

        result[:campaigns][campaign.title]['Campaigners'] = campaign_report.number_of_campaign_supporters
        result[:campaigns][campaign.title]['Actions completed'] = campaign_report.actions_completed
        result[:campaigns][campaign.title]['Most popular action'] = campaign_report.most_popular_action
        result[:campaigns][campaign.title]['Action types'] = campaign_report.action_types
        result[:campaigns][campaign.title]['Learning Resources'] = campaign_report.learning_resources_completed
      end

      result
    end
  end
end

class CampaignReportHelpers
  def initialize(campaign_id)
    @campaign_id = campaign_id
  end

  def number_of_campaign_supporters
    UserCampaign.where(campaign_id: @campaign_id).count
  end

  def number_of_campaign_partners
  end

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
                                   .group_by { |x| x.action.title }.map { |k,v| ["#{k} (#{v.size})", v.size] }

    return nil unless res.any?

    res.sort_by { |x| x[1] }.reverse.first[0]
  end
end

class ReportHelpers
  def initialize
  end

  def campaigns_per_user
    user_campaigns = UserCampaign.all.count

    (user_campaigns / User.count.to_f).round(3)
  end

  def actions_completed_per_user
    user_actions = UserAction.where(status: 'completed').count

    (user_actions / User.count.to_f).round(3)
  end

  def top_users
    user_ids = UserAction.where(status: 'completed').all.pluck(:user_id)
    counts = user_ids.group_by(&:itself).map { |k,v| [k, v.length] }.to_h.sort_by { |k,v| v }.reverse.take(5).to_h
    User.where(id: counts.keys).map { |x| [x.email, counts[x.id]] }.to_h
  end
end


# Execute with:
#   rails reports:all
namespace :reports do
  desc "Output reports"
  task :all, [:status] => [:environment] do |task, args|
    status = args[:status] || 'active'
    result = { campaigns: {}, overall: {} }
    report = ReportHelpers.new

    result[:overall]['User count'] = User.count
    result[:overall]['Actions completed'] = UserAction.where(status: 'completed').count
    result[:overall]['Campaigns joined'] = UserCampaign.count
    result[:overall]['Campaigners (Users who support at least one campaign)'] = UserCampaign.all.pluck(:user_id).uniq.size
    result[:overall]['Users who have completed at least one action'] = UserAction.where(status: 'completed').pluck(:user_id).uniq.size
    result[:overall]['Average campaigns per user'] = report.campaigns_per_user
    result[:overall]['Average actions per user'] = report.actions_completed_per_user
    result[:overall]['Top users (by actions completed)'] = report.top_users

    Campaign.send(status).each do |campaign|
      result[:campaigns][campaign.title] = {}
      campaign_report = CampaignReportHelpers.new(campaign.id)

      result[:campaigns][campaign.title]['Campaigners'] = campaign_report.number_of_campaign_supporters
      result[:campaigns][campaign.title]['Actions completed'] = campaign_report.actions_completed
      result[:campaigns][campaign.title]['Most popular action'] = campaign_report.most_popular_action
      result[:campaigns][campaign.title]['Action types'] = campaign_report.action_types
    end

    pp result
  end
end

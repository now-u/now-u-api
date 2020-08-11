class CampaignReportHelpers
  def initialize(from, to, campaign_id)
    @from = from || DateTime.parse('2020-07-01').beginning_of_day
    @to = to || DateTime.now.end_of_day
    @campaign_id = campaign_id
  end

  # of campaign supporters / app users
  def number_of_campaign_supporters
    UserCampaign.where(campaign_id: @campaign_id).where('user_campaigns.created_at BETWEEN ? and ?', @from, @to).count
  end

  def number_of_campaign_partners
  end

  def actions_completed
    UserAction.joins(:action).where('actions.campaign_id = ?', @campaign_id)
                             .where(status: 'completed')
                             .where('user_actions.updated_at BETWEEN ? and ?', @from, @to).count
  end

  def most_popular_action
    res = UserAction.joins(:action).where('actions.campaign_id = ?', @campaign_id)
                                   .where(status: 'completed')
                                   .where('user_actions.updated_at BETWEEN ? and ?', @from, @to)
                                   .group_by { |x| x.action.title }.map { |k,v| ["#{k} (#{v.size})", v.size] }
    return nil unless res.any?

    res.sort_by { |x| x[1] }.reverse.first[0]
  end

  # average # of actions marked done by users


  # of actions which achieved the highest percentage of completions per campaign
  # campaign actions ordered by completion

end

class ReportHelpers
  def initialize(from, to)
    @from = from || DateTime.parse('2020-07-01').beginning_of_day
    @to = to || DateTime.now.end_of_day
  end

  # total # of campaign supporters / app users each week

  # # of users signed up for  the campaigns versus the # of users who just downloaded the app

  # average # of campaigns per user
  def campaigns_per_user
    user_campaigns = UserCampaign.where('created_at BETWEEN ? and ?', @from, @to)
    return 0 unless user_campaigns.count > 0

    (user_campaigns.count / User.count.to_f).round(3)
  end

  # average # of actions marked done by users
  def actions_completed_per_user
    user_actions = UserAction.where(status: 'completed').where('updated_at BETWEEN ? and ?', @from, @to)
    return 0 unless user_actions.count > 0

    (user_actions.count / User.count.to_f).round(3)
  end
end


# Execute with:
#   rails reports:all
namespace :reports do
  desc "Output reports"
  task :all, [:from_date, :to_date] => [:environment] do |task, args|
    if args[:from_date] && args[:to_date]
      from = DateTime.parse(args[:from_date]).beginning_of_day
      to = DateTime.parse(args[:to_date]).end_of_day
    end
    result = { campaigns: {} }
    report = ReportHelpers.new(from, to)

    result[:average_campaigns_per_user] = report.campaigns_per_user
    result[:average_actions_per_user] = report.actions_completed_per_user

    Campaign.active.each do |campaign|
      result[:campaigns][campaign.title] = {}
      campaign_report = CampaignReportHelpers.new(from, to, campaign.id)


      result[:campaigns][campaign.title][:number_of_campaign_supporters] = campaign_report.number_of_campaign_supporters
      result[:campaigns][campaign.title][:actions_completed] = campaign_report.actions_completed
      result[:campaigns][campaign.title][:most_popular_action] = campaign_report.most_popular_action
    end

    pp result
  end
end

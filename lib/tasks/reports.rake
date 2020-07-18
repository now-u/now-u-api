class ReportHelpers
  def initialize(from, to)
    @from = from
    @to = to
  end

  def campaigns_per_user
    user_campaigns = UserCampaign.where('created_at BETWEEN ? and ?', @from, @to).pluck(:user_id)
    return 0 unless user_campaigns.size > 0

    campaigns_per_user = (user_campaigns.size / user_campaigns.uniq.size.to_f).round(3)
  end

  def actions_completed_per_user
    user_actions = UserAction.where(status: 'completed').where('updated_at BETWEEN ? and ?', @from, @to).pluck(:user_id)
    return 0 unless user_actions.size > 0

    campaigns_per_user = (user_actions.size / user_actions.uniq.size.to_f).round(3)
  end
end

# Execute with:
#   rails reports:all
namespace :reports do
  desc "Output reports"
  task :all, [:from_date, :to_date] => [:environment] do |task, args|
    from = DateTime.parse(args[:from_date]).beginning_of_day
    to = DateTime.parse(args[:to_date]).end_of_day
    result = {}
    report = ReportHelpers.new(from, to)

    result[:average_campaigns_per_user] = report.campaigns_per_user
    result[:average_actions_per_user] = report.actions_completed_per_user

    pp result
  end
end

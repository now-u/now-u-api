# frozen_string_literal: true

module Reports
  class ReportHelpers
    def initialize; end

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
      counts = user_ids.group_by(&:itself).transform_values(&:length).sort_by { |_k, v| v }.reverse.take(5).to_h
      User.where(id: counts.keys).map { |x| [x.email, counts[x.id]] }.to_h
    end
  end
end

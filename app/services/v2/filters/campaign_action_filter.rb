module V2
  module Filters
    module CampaignActionFilter
      MODEL = CampaignAction
      USER_MODEL = :campaign_actions

      FILTERS = {
        'cause__in' => :filter_by_cause,
        'limit' => :limit,
        'of_the_month' => :of_the_month,
        'recommended' => :recommended,
        'type' => :type,
        'type__in' => :type,
        'time__gte' => :time_gte,
        'time__lte' => :time_lte
      }

      USER_FILTERS = {
        'joined' => :campaign_actions,
        'completed' => :completed_actions_v2,
      }
    end
  end
end

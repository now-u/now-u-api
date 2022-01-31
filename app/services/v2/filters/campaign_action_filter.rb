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
        'type' => :type
      }

      USER_FILTERS = {
        'joined' => :joined?
      }
    end
  end
end

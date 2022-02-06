module V2
  module Filters
    module CampaignFilter
      MODEL = Campaign
      USER_MODEL = :campaigns

      FILTERS = {
        'cause__in' => :filter_by_cause,
        'limit' => :limit,
        'of_the_month' => :of_the_month,
        'recommended' => :recommended
      }

      USER_FILTERS = {
        'joined' => :campaigns,
        'completed' => :completed_campaigns_v2,
      }
    end
  end
end

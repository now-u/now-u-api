module V2
  module Filters
    module CampaignFilter
      MODEL = Campaign

      FILTERS = {
        'cause__in' => :filter_by_cause,
        'limit' => :limit,
        'of_the_month' => :of_the_month,
        'recommended' => :recommended
      }
    end
  end
end
module V2
  module Filters
    module CampaignFilter
      MODEL = Campaign

      FILTERS = {
        'cause__in' => :filter_by_cause,
        'limit' => :limit
      }
    end
  end
end

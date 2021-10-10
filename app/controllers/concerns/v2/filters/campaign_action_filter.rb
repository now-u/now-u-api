module V2
  module Filters
    module CampaignActionFilter
      MODEL = CampaignAction

      FILTERS = {
        'cause__in' => :filter_by_cause,
        'limit' => :limit
      }
    end
  end
end

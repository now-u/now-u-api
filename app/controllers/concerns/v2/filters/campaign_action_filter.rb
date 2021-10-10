module V2
  module Filters
    module CampaignActionFilter
      MODEL = CampaignAction

      FILTERS = {
        'cause__in' => :filter_by_cause
      }
    end
  end
end

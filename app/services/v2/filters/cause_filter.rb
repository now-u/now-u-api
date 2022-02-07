module V2
  module Filters
    module CauseFilter
      MODEL = Cause
      USER_MODEL = :causes

      FILTERS = {}

      USER_FILTERS = {
        'joined' => :causes,
      }
    end
  end
end

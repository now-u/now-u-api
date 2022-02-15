module V2
  module Filters
    module LearningResourceFilter
      MODEL = LearningResource
      USER_MODEL = :learning_resources

      FILTERS = {
        'cause__in' => :filter_by_cause,
        'limit' => :limit,
      }

      USER_FILTERS = {
        # 'completed' => :completed_learning_resources_v2,
      }
    end
  end
end

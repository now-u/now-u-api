module V2
  module Filters
    class CampaignFilter
      # to add more filters, use hash lookup to the model scope
      FILTERS = {
        "cause__in" => :filter_by_cause
      }
      attr_reader :query_params

      def initialize(request_url)
        @query_params = Addressable::URI.parse(request_url).query_values
      end

      def call
        # At the moment, this only supports singular
        # queries
        query_params.map do |key, query|
          Campaign.public_send(FILTERS[key], eval(query))
        end.first
      end
    end
  end
end

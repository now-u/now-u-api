module V2
  module Filters
    class Filter
      # to add more filters, use hash lookup to the model scope
      attr_reader :query_params, :filter_model

      def initialize(request_url:, filter_model:)
        @query_params = Addressable::URI.parse(request_url).query_values
        @filter_model = filter_model
      end

      def call
        # At the moment, this only supports singular
        # queries
        query_params.map do |key, query|
          next unless filter_model::FILTERS[key]

          filter_model::MODEL.public_send(filter_model::FILTERS[key], JSON(query))
        end.first
      end
    end
  end
end

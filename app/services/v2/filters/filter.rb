module V2
  module Filters
    class Filter
      class InvalidFilter < StandardError;end
      # To add more filters, use hash lookup to the model scope
      attr_reader :query_params, :filter_model, :user_token, :data

      def initialize(request:, filter_model:, data:)
        @query_params = Addressable::URI.parse(request.url).query_values
        @filter_model = filter_model
        @data = data
        @user_token = request.headers['token']
      end

      def call
        return data unless query_params

        # TODO: Adding ability to filter user specific data, such as joined=true

        # At the moment, this only supports singular
        # queries

        # TODO: multiple queries
        # Perhaps we need to daisy chain the scopes using recursive public_sends to ensure
        # that when multiple queries are added, they are scoped correctly
        query_params.map do |key, query|
          raise InvalidFilter, "Invalid filter '#{key}' for model #{filter_model::MODEL}" unless filter_model::FILTERS[key]

          filter_model::MODEL.public_send(filter_model::FILTERS[key], JSON(query))
        end.first
      end
    end
  end
end

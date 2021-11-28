module V2
  module Filters
    class Filter
      class InvalidFilter < StandardError;end
      # To add more filters, use hash lookup to the model scope
      attr_reader :filter_model, :user_token

      def initialize(request:, filter_model:, data:)
        @query_params = Addressable::URI.parse(request.url).query_values
        @filter_model = filter_model
        @data = data
        @user_token = request.headers['token']
      end

      def call(query_params = @query_params, data = @data)
        return data unless query_params&.any?

        # TODO: Adding ability to filter user specific data, such as joined=true

        call(query_params.except(query_params.first[0]), scope_data(query_params.first[0], query_params.first[1]))
      end

      private

      def scope_data(key, query)
        raise InvalidFilter, "Invalid filter '#{key}' for model #{filter_model::MODEL}" unless filter_model::FILTERS[key]

        filter_model::MODEL.public_send(filter_model::FILTERS[key], JSON(query))
      end
    end
  end
end

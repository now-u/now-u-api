module V2
  module Filters
    class Filter
      class InvalidFilter < StandardError;end
      # To add more filters, use hash lookup to the model scope
      attr_reader :filter_model

      def initialize(request:, filter_model:, data:)
        @query_params = Addressable::URI.parse(request.url).query_values
        @filter_model = filter_model
        @data = data
        @user = User.get_user_from_request(request)
      end

      def call(query_params = @query_params, data_scope = @data)
        return data_scope unless query_params&.any?

        query_param(query_params)

        call(query_params.except(@query_param.key), scope_data(@query_param.key, @query_param.value, data_scope))
      end

      private

      def scope_data(key, query, data_scope)
        raise InvalidFilter, "Invalid filter '#{key}' for model #{filter_model::MODEL}" unless filter_model::FILTERS[key] || filter_model::USER_FILTERS[key]

        if user_query?(key)
          # NOTE: This only returns all instances of the join table. This is because at the time of writing,
          # the only user-specific filter we have is `joined` and `completed`, which naturally should send us all
          # user-related data back
          @user.public_send(filter_model::USER_FILTERS[key], JSON(query)).where(id: data_scope.pluck(:id))
        else
          data_scope.public_send(filter_model::FILTERS[key], JSON(query))
        end
      end

      def user_query?(key)
        filter_model::USER_FILTERS[key]
      end

      def query_param(query_params)
        @query_param = OpenStruct.new(
          key: query_params.first[0],
          value: query_params.first[1]
        )
      end
    end
  end
end

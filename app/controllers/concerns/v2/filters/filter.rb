module V2
  module Filters
    class Filter
      # to add more filters, use hash lookup to the model scope
      attr_reader :query_params, :model
      include ::V2::Filters::CampaignFilter
      include ::V2::Filters::CampaignActionFilter

      def initialize(request_url:, model:)
        @query_params = Addressable::URI.parse(request_url).query_values
        @model = model
      end

      def call
        # At the moment, this only supports singular
        # queries
        query_params.map do |key, query|
          model.public_send("::V2::Filters::#{model}Filter::FILTERS".constantize[key], eval(query))
        end.first
      end
    end
  end
end


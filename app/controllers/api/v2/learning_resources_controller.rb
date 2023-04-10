# frozen_string_literal: true
include ::V2::Progress::UserProgress

class Api::V2::LearningResourcesController < APIApplicationController
  rescue_from JSON::ParserError, with: :invalid_json_message

  def index
    page_size = Addressable::URI.parse(request.url).query_values["page_size"]

    Pagy::DEFAULT[:items] = page_size || 25
    @pagy, @learning_resources = pagy(LearningResource.all)

    render json: { data: learning_resources_data(@learning_resources), pagination_metadata: get_pagy_metadata(@pagy, page_size) }, status: :ok
  end

  def show
    render json: { data: learning_resource_data }, status: :ok
  end

private

  def learning_resources_data(data)
    ::V2::Filters::Filter.new(request: request, filter_model: ::V2::Filters::LearningResourceFilter, data: data).call.map do |learning_resource|
      merge_additional_fields(learning_resource)
    end
  end

  def learning_resource_data
    LearningResource.find(params[:id]).serializable_hash.symbolize_keys.merge(additional_fields(params[:id]))
  end

  def additional_fields(learning_resource_id)
    {
      causes: get_learning_resource_causes(learning_resource_id),
      completed: get_learning_resource_status(request.headers['token'], learning_resource_id),
    }
  end

  def merge_additional_fields(model)
    model.serializable_hash.symbolize_keys.merge(additional_fields(model.id))
  end

  def get_learning_resource_causes(learning_resource_id)
    LearningResource.find(learning_resource_id)&.causes.map do |lrc|
      lrc.serializable_hash.symbolize_keys.merge({joined: get_status(lrc.id, request)})
    end
  end

  def get_pagy_metadata(metadata, page_size)
    {
      count: metadata.count,
      page: metadata.page,
      pages: metadata.pages,
      next: metadata.next,
      prev: metadata.prev,
      next_url: api_v2_learning_resources_url(page_size: page_size, page: metadata.next),
      prev_url: api_v2_learning_resources_url(page_size: page_size, page: metadata.prev)
    }
  end
end

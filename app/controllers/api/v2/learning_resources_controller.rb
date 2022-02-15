# frozen_string_literal: true

class Api::V2::LearningResourcesController < APIApplicationController
  rescue_from JSON::ParserError, with: :invalid_json_message

  def index
    render json: { data: learning_resources_data }, status: :ok
  end

  def show
    render json: { data: learning_resource_data }, status: :ok
  end

private

  def learning_resources_data
    ::V2::Filters::Filter.new(request: request, filter_model: ::V2::Filters::LearningResourceFilter, data: LearningResource.all).call.map do |learning_resource|
      merge_additional_fields(learning_resource)
    end
  end

  def learning_resource_data
    LearningResource.find(params[:id]).serializable_hash.symbolize_keys.merge(additional_fields(params[:id]))
  end

  def additional_fields(learning_resource_id)
    {
      causes: LearningResource.find(learning_resource_id)&.causes,
      completed: get_status(learning_resource_id),
    }
  end

  def merge_additional_fields(model)
    model.serializable_hash.symbolize_keys.merge(additional_fields(model.id))
  end

  def get_status(learning_resource_id)
    return 'Authentication failed' unless request.headers['token'] && user

    user.user_learning_resources.find_by(learning_resource_id: learning_resource_id)&.status
  end
end

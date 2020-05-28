class Api::Admin::V1::AdminController < ActionController::API
  # before_action :validate_api_key

  private

  def validate_api_key
    api_key = request.headers['admin_api_key']
    return if api_key == Rails.application.config.admin_api_key

    render json: {}, status: :unauthorized
  end
end

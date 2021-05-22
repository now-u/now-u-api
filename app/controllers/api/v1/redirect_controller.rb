# frozen_string_literal: true

class Api::V1::RedirectController < APIApplicationController
  def create
    url = params[:url]

    raise StandardError, "Invalid URL '#{url}'" unless url.present?

    redirect_to url
  end
end

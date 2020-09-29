class Api::V1::RedirectController < ApplicationController
  def create
    url = params[:url]

    raise StandardError, "Invalid URL '#{url}'" unless url.present?

    redirect_to url
  end
end

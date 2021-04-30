# frozen_string_literal: true

class Api::V1::AppVersionController < ApplicationController
  def check
    last_version = AppVersion.all.last
    version = AppVersion.find_by(version_number: params[:version_number])

    if version.version_number == last_version.version_number
      render json: {}, status: :ok
    elsif version.compatible_with_current_api
      render text: 'UPDATE AVAILABLE', status: :ok
    else
      render text: 'DEPRECIATED', status: 299
    end
  end
end

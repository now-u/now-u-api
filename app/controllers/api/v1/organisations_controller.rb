class Api::V1::OrganisationsController < ApplicationController
  def index
    render json: { data: Organisation.all }, status: :ok
  end
end

class Api::V1::OrganisationsController < ApplicationController
  def index
    data = { data: Organisation.all }
    data = data.to_json(
      include: [:campaigns]
    )

    render json: data, status: :ok
  end
end

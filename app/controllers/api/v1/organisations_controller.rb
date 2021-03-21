# frozen_string_literal: true

class Api::V1::OrganisationsController < APIApplicationController
  def index
    data = { data: Organisation.all }
    data = data.to_json(
      include: [:campaigns]
    )

    render json: data, status: :ok
  end

  def show
    render json: Organisation.find(params[:id]), root: 'data', status: :ok, adapter: :json
  end
end

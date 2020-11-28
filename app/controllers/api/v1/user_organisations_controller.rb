# frozen_string_literal: true

class Api::V1::UserOrganisationsController < ApplicationController
  before_action :set_user

  def update
    @user.update(organisation_id: nil)

    render json: { data: @user.reload }, status: :ok
  end
end

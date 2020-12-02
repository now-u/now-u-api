# frozen_string_literal: true

class Api::V1::UserLearningResourcesController < ApplicationController
  before_action :set_user

  def index
    render json: { data: @user.learning_resources }, status: :ok
  end

  def create
    UserLearningResource.where(user_id: @user.id, learning_resource_id: params[:id]).first_or_create!

    render json: user_response, status: :ok
  end

  def destroy
    UserLearningResource.where(user_id: @user.id, learning_resource_id: params[:id]).destroy_all

    render json: user_response, status: :ok
  end
end

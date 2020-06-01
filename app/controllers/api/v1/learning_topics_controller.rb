class Api::V1::LearningTopicsController < ApplicationController
  def index
    render json: { data: Campaign.find(params[:id]).learning_topics }, status: :ok
  end
end
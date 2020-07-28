class Api::V1::LearningTopicsController < ApplicationController
  def index
    render json: learning_topics, status: :ok
  end

  private

  def learning_topics
    data = { data: Campaign.find(params[:id]).learning_topics.order('priority ASC') }
    data.to_json(
      include: [:learning_resources]
    )
  end
end

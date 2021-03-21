# frozen_string_literal: true

class Api::V1::LearningTopicsController < APIApplicationController
  def index
    render json: learning_topics, root: 'data', status: :ok, adapter: :json
  end

  def show
    render json: LearningTopic.find(params[:id]), root: 'data', status: :ok, adapter: :json
  end

  private

  def learning_topics
    Campaign.find(params[:id]).learning_topics.order('priority ASC')
  end
end

class Api::V1::QuizController < ApplicationController
  def index
    render json: Quiz.all, root: 'data', status: :ok, adapter: :json
  end

  def show
    render json: Quiz.find(params[:id]), root: 'data', status: :ok, adapter: :json
  end
end

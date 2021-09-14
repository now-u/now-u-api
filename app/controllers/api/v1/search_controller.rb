# frozen_string_literal: true

class Api::V1::SearchController < ApplicationController
  def index
    if params[:query].present?
      result = {
        campaigns: Campaign.all.search(params[:query]),
        # {causes: Cause.all.search(params[:query])},
        learning_resources: LearningResource.all.search(params[:query]),
        campaign_actions: CampaignAction.all.search(params[:query])
      }
      render json: { result: result }
    else
      render json: { result: 'no query' }
    end
  end

  def search
    case params[:model]
    when 'campaigns'
      result = { campaigns: Campaign.all.search(params[:query]) }
      if params[:query].present?
        render json: { result: result }
      else
        render json: { result: 'no query' }
      end
    when 'learning_resources'
      result = { learning_resources: LearningResource.all.search(params[:query]) }
      if params[:query].present?
        render json: { result: result }
      else
        render json: { result: 'no query' }
      end
    when 'campaign_actions'
      result = { campaign_actions: CampaignAction.all.search(params[:query]) }
      if params[:query].present?
        render json: { result: result }
      else
        render json: { result: 'no query' }
      end
    else
      render json: { result: 'No search model' }
    end
  end
end

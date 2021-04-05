class Api::V1::SearchController < ApplicationController
        def index
        if params[:query].present?
            result = [
                {campaings: Campaign.all.search(params[:query])},
                # {causes: Cause.all.search(params[:query])},
                {learning_resources: LearningResource.all.search(params[:query])},
                {actions: Action.all.search(params[:query])}
            ]
            render json: {result: result}
        else
            render json: {result: 'no query'}
        end
    end
end

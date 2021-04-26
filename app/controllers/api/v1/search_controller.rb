class Api::V1::SearchController < ApplicationController
    def index
        if params[:query].present?
            result = {
                campaigns: Campaign.all.search(params[:query]),
                # {causes: Cause.all.search(params[:query])},
                learning_resources: LearningResource.all.search(params[:query]),
                actions: Action.all.search(params[:query])
            }
            render json: {result: result}
        else
            render json: {result: 'no query'}
        end
    end
    def search
        if params[:model] == "campaigns"
            result = { campaigns: Campaign.all.search(params[:query]) }
            if params[:query].present?
                render json: {result: result}
            else 
                render json: {result: 'no query'}
            end
        elsif params[:model] == "learning_resources"
            result = { learning_resources: LearningResource.all.search(params[:query]) }
            if params[:query].present?
                render json: {result: result}
            else 
                render json: {result: 'no query'}
            end
        elsif params[:model] == "actions"
            result = { actions: Action.all.search(params[:query]) }
            if params[:query].present?
                render json: {result: result}
            else 
                render json: {result: 'no query'}
            end
        else
            render json: {result: 'No search model'}
        end
    end
end

# frozen_string_literal: true

class ReportsController < ActionController::Base
  def index
    if params[:key] == 'feb89cc6e9b86f6d81c991cebb8205658e2226bf718ece30b8575755f2be'
      status = params[:status] || 'active'
      @report_data = Reports::CampaignReports.new(status: status).report
      render template: 'reports'
    else
      render json: { error: 'No access' }, status: 401
    end
  end
end

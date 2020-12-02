# frozen_string_literal: true

# Execute with:
#   rails reports:all
namespace :reports do
  desc 'Output reports'
  task :all, [:status] => [:environment] do |_task, args|
    status = args[:status] || 'active'
    result = Reports::CampaignReports.new(status: status).report
    pp result
  end
end

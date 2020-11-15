
# Execute with:
#   rails reports:all
namespace :reports do
  desc "Output reports"
  task :all, [:status] => [:environment] do |task, args|
    status = args[:status] || 'active'
    result = Reports::CampaignReports.new(status: status).report
    pp result
  end
end

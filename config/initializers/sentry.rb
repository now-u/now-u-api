Sentry.init do |config|
  config.dsn = ENV['SENTRY_DSN']

  config.environment = Rails.env
  config.breadcrumbs_logger = [:sentry_logger, :http_logger]

  config.traces_sample_rate = 0.01
end
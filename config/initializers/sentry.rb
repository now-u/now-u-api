Sentry.init do |config|
  if Rails.env.production?
    config.dsn = ENV['SENTRY_PRODUCTION_DSN']
  else Rails.env.staging?
    config.dsn = ENV['SENTRY_STAGING_DSN']
  end
  config.breadcrumbs_logger = [:sentry_logger, :http_logger]

  config.traces_sample_rate = 0.01
end
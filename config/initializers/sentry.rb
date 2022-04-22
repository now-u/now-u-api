Sentry.init do |config|
  config.dsn = 'https://e43549eae9bb4f81891972b87e79b5ee@o1209445.ingest.sentry.io/6356423'
  config.breadcrumbs_logger = [:sentry_logger, :http_logger]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 0.5
  # or
  config.traces_sampler = lambda do |context|
    0.5
  end
end
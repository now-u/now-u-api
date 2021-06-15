
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID_TEST'], ENV['FACEBOOK_APP_SECRET_TEST'],
  provider_ignores_state: true
end
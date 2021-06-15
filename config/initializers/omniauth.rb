
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID_TEST'], ENV['FACEBOOK_APP_SECRET_TEST'],
  options = {
    name: :facebook,
    response_type: :code,
    callback_url: "/auth/facebook/callback",
  },
  provider_ignores_state: true
end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']

  # OmniAuth.config.logger = Rails.logger

  # client_options = {
  #   identifier: ENV['FACEBOOK_APP_ID'],
  #   secret: ENV['FACEBOOK_APP_SECRET'],
  #   redirect_uri: "http://localhost:3000/api/v1/auth/facebook/callback"&.to_s,
  # }

  # options = {
  #   response_type: :code,
  #   path_prefix: "/auth",
  #   callback_path: "/auth/facebook/callback",
  #   client_options: client_options,
  # }
end
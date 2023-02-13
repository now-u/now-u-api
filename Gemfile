# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'active_hash', '~> 3.1'
gem 'active_model_serializers', '~> 0.10.10'
gem 'aws-sdk-ses', '~> 1.49'
gem 'aws-sdk-sns', '~> 1.52'
gem 'bitly', '~> 2.0', '>= 2.0.1'
gem 'database_cleaner'
gem 'factory_bot_rails'
gem 'gibbon', '~> 3.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 6.1'
gem 'rails', '~> 5.2.3'
gem 'rails-controller-testing'
gem 'rspec-rails'
gem 'sendgrid-ruby'
gem 'rails_admin'
gem 'devise'
gem 'devise_saml_authenticatable'
gem 'cancancan'
gem 'faker'
gem 'rswag'
gem 'bootstrap-sass', '3.4.1'
gem 'aws-sdk-s3', require: false
gem 'sentry-ruby'
gem 'sentry-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'rubocop'
  gem 'shoulda-matchers', '~> 5.1'
end

group :development do
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'pg_search'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

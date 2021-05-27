# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'active_hash', '~> 3.1'
gem 'active_model_serializers', '~> 0.10.10'
gem 'aws-sdk-ses', '~> 1.32'
gem 'aws-sdk-sns', '~> 1.27'
gem 'bitly', '~> 2.0', '>= 2.0.1'
gem 'gibbon', '~> 3.3', '>= 3.3.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'

# Testing 
gem 'database_cleaner'
gem 'rails-controller-testing'
gem 'rspec-rails'
gem 'sendgrid-ruby'
gem 'rails-controller-testing'

# For creating mock models to test
gem 'factory_bot_rails'

# For creating mock data to test
gem 'faker'

# For the admin panel
gem 'rails_admin' 

# For authentication
gem 'devise'

# Omniauth Facebook plugin for SSO
gem 'omniauth-facebook'

# For authorisation
gem 'cancancan'

# For environment variables

gem 'dotenv-rails', groups: [:development, :test]

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop'
  gem 'shoulda-matchers', '~> 4.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.6'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'pg_search'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

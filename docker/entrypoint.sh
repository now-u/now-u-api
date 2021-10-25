#!/bin/bash
set -e

unset BUNDLE_PATH
unset BUNDLE_BIN

# Remove a potentially pre-existing server.pid for Rails.
rm -f /now-u-api/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).

echo "Bundling gems"
bundle install --jobs 8 --retry 3

echo "Clearing logs"
bin/rake log:clear

echo "Creating databases"
bundle exec rake db:create

echo "Run migrations"
bundle exec rake db:migrate

echo "Seed database"
bundle exec rake db:seed

echo "Removing contents of tmp dirs"
bin/rake tmp:clear

exec "$@"

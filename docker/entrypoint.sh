#!/bin/bash
set -e

unset BUNDLE_PATH
unset BUNDLE_BIN

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid
rm -f /usr/src/app/tmp/pids/server.pid

echo "Clearing logs"
bin/rake log:clear

echo "Creating databases"
bundle exec rake db:create

echo "Run migrations"
bundle exec rake db:migrate

# echo "Seed database"
# bundle exec rake db:seed

echo "Removing contents of tmp dirs"
bin/rake tmp:clear

echo "Generating swagger spec"
bundle exec rake rswag:specs:swaggerize

exec "$@"

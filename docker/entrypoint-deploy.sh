#!/bin/bash
set -e

unset BUNDLE_PATH
unset BUNDLE_BIN

# Remove a potentially pre-existing server.pid for Rails.
rm -f /now-u-api/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).

#bundle install

echo "Bundling gems"
bundle install --without development test --jobs 8 --retry 3

echo "Clearing logs"
bin/rake log:clear
#
echo "Run migrations"
bundle exec rake db:migrate
#
echo "Removing contents of tmp dirs"
bin/rake tmp:clear

#echo "Doing the rake thing"
#bundle exec rake DATABASE_URL=postgresql:no_db:precompile

echo "Starting app server ..."
bundle exec rails s -p 3000 -b '0.0.0.0'

#rails db:create db:migrate db:seed

exec "$@"

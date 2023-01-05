#!/bin/sh
set -e

unset BUNDLE_PATH
unset BUNDLE_BIN

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/app/tmp/pids/server.pid
rm -f /app/tmp/pids/server.pid

echo "Clearing logs"
bundle exec rails log:clear
#
echo "Run migrations"
bundle exec rails db:migrate
#
echo "Removing contents of tmp dirs"
bundle exec rails tmp:clear

exec "$@"

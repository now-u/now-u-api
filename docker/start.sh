#!/bin/bash

echo "Starting app server ..."
bundle exec rails s -p 3000 -b '0.0.0.0'

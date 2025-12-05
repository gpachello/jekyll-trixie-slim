#!/bin/bash
set -e

bundle config set --local path "/gems"

if [ ! -f "_config.yml" ]; then
    bundle exec jekyll new . --skip-bundle --force
fi

if [ -f "Gemfile" ]; then
    bundle install
fi

exec "$@"

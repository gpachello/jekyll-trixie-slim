#!/bin/bash
set -e

bundle config set --local path "/gems"

if [ ! -f "_config.yml" ]; then
    jekyll new . --skip-bundle
fi

if [ -f "Gemfile" ]; then
    bundle install
fi

exec "$@"

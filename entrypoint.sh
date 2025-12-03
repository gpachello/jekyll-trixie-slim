#!/bin/bash
set -e

echo "==> Configurando Bundler..."
bundle config set --local path "/gems"

if [ -f "Gemfile" ]; then
    echo "==> Instalando dependencias..."
    bundle install
fi

echo "==> Iniciando comando:"
exec "$@"

#!/bin/bash
set -eux

# Instala dependências webpacker
yarn install

# Prepera o ambiente rails
bin/rails db:drop 
bin/rails db:create 
bin/rails db:migrate
bin/rails db:seed

exec "$@"
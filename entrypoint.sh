#!/bin/bash
set -eux

# Instala dependências webpacker
yarn install

# Verifica se é o primeiro build
if [ ! -f /.first_build_done ]; then
  # Prepera o ambiente rails
  bin/rails db:drop 
  bin/rails db:create 
  bin/rails db:migrate
  bin/rails db:seed

  # Marca o primeiro build como concluído
  touch /.first_build_done
fi

exec "$@"
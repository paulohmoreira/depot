#!/bin/bash
set -eux

# Instala dependências webpacker
yarn install

# Verifica se é o primeiro build
if [ ! -f /.first_build_done ]; then
  # Prepera o ambiente rails
  bin/rails db:setup

  # Marca o primeiro build como concluído
  touch /.first_build_done
fi

exec "$@"
#!/bin/bash

# Espera a que el servicio de base de datos esté listo
#while ! pg_isready -U postgres -h db -p 5432 >/dev/null 2>&1; do
#  sleep 1
#done

echo "ejecutando db:migrate"
# Ejecuta las migraciones
bundle exec rails db:migrate

echo "db:migrate ejecutados"

# Inicia el servidor de Rails
bundle exec rails server -b 0.0.0.0

#!/bin/bash

# Espera a que el servicio de base de datos esté listo
#while ! pg_isready -U postgres -h db -p 5432 >/dev/null 2>&1; do
#  sleep 1
#done

#ECHO
#echo "Ejecutando db:migrate"
#bundle exec rails db:migrate
#ECHO
#echo "Ejecutado db:migrate"

#ECHO
#echo "Levantando rails server"
#bundle exec rails server -b 0.0.0.0
#ECHO
#echo "Rails server levantado"
echo "entrypoint vacío"

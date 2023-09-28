#!/usr/bin/bash

# Testing: waits for database service to go up
# while ! pg_isready -U postgres -h db -p 5432 >/dev/null 2>&1; do
#  sleep 1
#done

#ECHO
echo "Executing db:create"
bundle exec rails db:create

#ECHO
echo "Executing db:migrate"
bundle exec rails db:migrate

#ECHO
echo "Bringin up rails server"
bundle exec rails server -b 0.0.0.0




#!/bin/sh

# if [ ! -z "${MASTER_KEY}" ]; then
#    echo "No master key" 
#    exit 1
# else
#    printf "${MASTER_KEY}" > ./config/master.key
# fi
# Master key
printf "56a367f36a4897a87bff47c0e84b7b1f" > ./config/master.key

rake db:create
bin/rails db:migrate
rails db:seed

rails s

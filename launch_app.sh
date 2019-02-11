#!/bin/sh

rake db:create
bin/rails db:migrate
rails db:seed

puma -C config/puma.rb
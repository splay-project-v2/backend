#!/bin/sh

rake db:create
bin/rails db:migrate
rails db:seed

rails s

FROM ruby:2.5.3-alpine

RUN apk update && apk add build-base nodejs sqlite-dev tzdata

RUN mkdir /app
WORKDIR /app

RUN gem install bundler

COPY ./Gemfile* ./
RUN bundle install

COPY . .

RUN rake db:create
RUN bin/rails db:migrate RAILS_ENV=development

CMD puma -C config/puma.rb
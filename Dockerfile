FROM ruby:2.5.3-alpine

RUN apk update && apk add build-base mariadb-dev nodejs tzdata

ENV MYSQL_PASSWORD splay
ENV MYSQL_USERNAME splay
ENV RAILS_ENV development

RUN mkdir /app
WORKDIR /app

RUN gem install bundler

COPY ./Gemfile* ./
RUN bundle install

COPY . .

CMD ["./launch_app.sh"]
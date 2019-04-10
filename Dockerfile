FROM ruby:2.5.3-alpine
HEALTHCHECK --interval=30s --timeout=30s --retries=20 \
  CMD curl --silent --fail localhost:3000 || exit 1

RUN apk update && apk upgrade && \
    apk add --no-cache build-base mariadb-dev nodejs tzdata gmp-dev \
    libxml2-dev libxslt-dev curl

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
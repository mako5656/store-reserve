FROM ruby:3.2.9-alpine3.21

RUN apk update && apk add --no-cache \
    build-base \
    yaml-dev \
    mysql-dev \
    tzdata \
    gcompat

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

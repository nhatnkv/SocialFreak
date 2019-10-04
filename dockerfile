FROM ruby:2.5.3

RUN apt-get update && apt-get install build-base nodejs postgresql-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . .

LABEL maintainer="Nhatnkv <nhatnkv@gmail.com>"

CMD puma -C config/puma.rb
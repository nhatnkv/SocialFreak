FROM ruby:2.5.3

RUN apt-get update && apt-get install -y nodejs postgresql postgresql-contrib 

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

EXPOSE 3000
ENV RAILS_ENV production

COPY . .

LABEL maintainer="Nhatnkv <nhatnkv@gmail.com>"

CMD puma -C config/puma.rb
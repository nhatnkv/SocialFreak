FROM ruby:2.5.3

RUN apt-get update && apt-get install -y postgresql postgresql-contrib

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -qq -y build-essential nodejs yarn \
    libpq-dev \
    mysql-client 

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

EXPOSE 3000
ENV RAILS_ENV production
ENV rails assets:precompile

COPY . .

LABEL maintainer="Nhatnkv <nhatnkv@gmail.com>"

CMD puma -C config/puma.rb
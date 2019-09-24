# We set the base image to be ruby 2.3.1
FROM ruby:2.3.1
# The author of the file
MAINTAINER Nhatnkv <nhatnkv@gmail.com>
# Things we will need.
RUN apt-get update && \
apt-get install -y nodejs \
vim \
less \
mysql-client \
imagemagick \
--no-install-recommends && \
rm -rf /var/lib/apt/lists/*
# Init the root path
RUN mkdir -p /home/ubuntu/myProject
# We set it as env variable
ENV RAILS_ROOT /home/ubuntu/myProject
# We set /home/ubuntu/myProject to be the root of the project
WORKDIR $RAILS_ROOT
# The log of shoryuken will be in shared/log
RUN mkdir -p shared/log && touch shared/log/shoryuken.log
# We add the gemfiles of the project
ADD Gemfile $RAILS_ROOT/Gemfile
ADD Gemfile.lock $RAILS_ROOT/Gemfile.lock
# We copy all the project to the root path
ADD . $RAILS_ROOT
# We install bundler
RUN gem install bundler
# Run bundle install to install al the gems
RUN bundle install
# Precompile the assets
RUN bundle exec rake assets:precompile
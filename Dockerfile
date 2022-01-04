FROM ruby:2.5.0

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update -yqq \
    && apt-get install -y \
    nodejs \
    postgresql-client

ENV BUNDLER_VERSION='2.0.2'
RUN gem install bundler --no-document -v '2.0.2'

RUN bundle config --global frozen 1
RUN npm install

RUN mkdir /now-u-api
WORKDIR /now-u-api

COPY Gemfile* ./

RUN gem update --system

RUN bundle install --with=development

COPY . .

COPY ./docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
COPY ./docker/start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh

ENTRYPOINT ["entrypoint.sh"]

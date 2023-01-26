FROM ruby:2.7.4-alpine3.12 as builder

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  bash \
  && rm -rf /var/cache/apk/*

RUN apk add --update --no-cache tzdata && \
    cp /usr/share/zoneinfo/Europe/London /etc/localtime && \
    echo "Europe/London" > /etc/timezone

COPY Gemfile Gemfile.lock ./

RUN apk add --update --no-cache --virtual build-dependances \
    postgresql-dev build-base && \
    apk add --update --no-cache libpq yarn shared-mime-info && \
    bundle install --jobs=4 --without development && \
    rm -rf /usr/local/bundle/cache && \
    apk del build-dependances

COPY package.json yarn.lock ./
RUN  yarn install --frozen-lockfile && \
     yarn cache clean

COPY . .

RUN echo export PATH=/usr/local/bin:\$PATH > /root/.ashrc
ENV ENV="/root/.ashrc"

RUN bundle exec rake DATABASE_URL=postgresql:does_not_exist assets:precompile

EXPOSE 3000

RUN rm -rf node_modules tmp

ARG COMMIT_SHA
ENV COMMIT_SHA=$COMMIT_SHA

RUN chmod +x /app/docker/start.sh
RUN chmod +x /app/docker/entrypoint.sh

FROM builder as dev
RUN bundle install
COPY ./docker/start.sh /start
COPY ./docker/entrypoint.sh /entrypoint
RUN chmod +x /start
RUN chmod +x /entrypoint
ENTRYPOINT ["/entrypoint"]

FROM builder as prod
RUN chmod +x /app/docker/entrypoint-deploy.sh
ENTRYPOINT ["/app/docker/entrypoint-deploy.sh"]

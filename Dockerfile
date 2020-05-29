FROM ruby:2.5.0
RUN apt-get update -yqq \
    && apt-get install -y \
    nodejs \
    postgresql-client

ENV BUNDLER_VERSION='2.0.2'
RUN gem install bundler --no-document -v '2.0.2'

RUN bundle config --global frozen 1

RUN mkdir /now-u-api
WORKDIR /now-u-api

COPY Gemfile* ./

RUN gem update --system

RUN bundle install

COPY . .

RUN gem -v

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]


#ENV GEM_HOME="/usr/local/bundle"
#ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
#RUN gem install bundler --no-document -v '2.0.2'
#RUN gem install rubygems-bundler --no-rdoc --no-ri
#RUN bundle install
#COPY . /now-u-api

# Add a script to be executed every time the container starts.
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#EXPOSE 3000

# Start the main process.
#CMD ["rails", "server", "-b", "0.0.0.0"]
#CMD ["rails db:create db:migarte db:seed"]

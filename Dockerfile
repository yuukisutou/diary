FROM ruby:2.5.8
RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  nodejs
RUN mkdir /app_name
ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT

# 8080番でポートを起動する
CMD /bin/sh -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 8080 -b '0.0.0.0'"

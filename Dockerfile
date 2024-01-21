FROM ruby:3.0

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock app.rb config.ru ./
RUN bundle install

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]



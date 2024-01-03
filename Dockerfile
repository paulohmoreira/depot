FROM ruby:2.7.6

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=true apt-key add - && \
  curl -fsSL https://deb.nodesource.com/setup_12.x | bash - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -yqq && apt-get install -yqq --no-install-recommends \ 
  nodejs \ 
  yarn \ 
  python2

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

RUN bundle install 

COPY . /usr/src/app/

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["sh", "./entrypoint.sh"]

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
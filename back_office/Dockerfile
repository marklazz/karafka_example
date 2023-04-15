FROM debian:11
ARG DEBIAN_FRONTEND=noninteractive
ARG DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update && apt-get install -y \
    git \
    wget \
    build-essential \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    ca-certificates \
    libsqlite3-dev \
    imagemagick \
    ghostscript \
    clamdscan \
    libmagic-dev \
    python \
    file \
    xvfb \
    libpq-dev

RUN git clone https://github.com/rbenv/ruby-build.git && \
  PREFIX=/usr/local ./ruby-build/install.sh && \
  rm -rf ./ruby-build && \
  CONFIGURE_OPTS=--disable-install-doc ruby-build -v 2.7.1 /usr/local && \
  echo "install: --no-document" >> ~/.gemrc && \
  echo "update: --no-document" >> ~/.gemrc && \
  gem install bundler -v 1.17.3

RUN apt-get update && \
  apt-get install -y nodejs npm && \
  npm install -g n && \
  n 8

RUN npm install -g yarn@1.22.17 && \
  apt-get remove --purge -y nodejs npm

ENV NODE_VERSION=16.13.0
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

RUN yarn install --frozen-lockfile && \
  yarn cache clean
 
ENV APP_NAME karafka_example
ENV APP_HOME /app/$APP_NAME
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
ADD . $APP_HOME

ARG BUNDLE_INSTALL_ARGS="--without development test -j32"
RUN bundle install ${BUNDLE_INSTALL_ARGS} 
RUN RAILS_ENV=production SECRET_KEY_BASE=1 bundle exec rake assets:precompile

RUN rm -rf /tmp/* && \
    rm -rf .docker

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]

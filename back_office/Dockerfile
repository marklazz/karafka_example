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

ENV APP_NAME karafka_example
ENV APP_HOME /app/$APP_NAME
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
ADD . $APP_HOME

RUN rm -rf /tmp/* && \
    rm -rf .docker

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]

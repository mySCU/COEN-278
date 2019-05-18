FROM debian:latest

# ruby
RUN apt-get update \
    && apt-get install -y \
        ruby \
        ruby-dev \
        build-essential \
        libsqlite3-dev \
        vim

# Ruby on Rails
RUN gem install \
        Rails

# COPY demo /usr/src/demo

# WORKDIR /usr/src/demo

# CMD [ "bash" ]

EXPOSE 80
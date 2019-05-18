# Sinnatra

FROM debian:latest
LABEL maintainer "Amblizer <me@amblizer.xyz>"

# ruby
RUN apt-get update \
    && apt-get install -y \
        ruby \
        ruby-dev \
        build-essential \
        libsqlite3-dev \
        vim

# sinatra, THIN server
RUN gem install \
        sinatra \
        sinatra-reloader \
        thin \
        data_mapper \
        dm-sqlite-adapter

COPY demo /usr/src/demo

WORKDIR /usr/src/demo

CMD [ "bash" ]

EXPOSE 80
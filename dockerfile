FROM debian:latest

# ruby
RUN apt-get update \
    && apt-get install -y \
        ruby \
        vim

# sinatra
RUN gem install \
        sinatra \
        sinatra-reloader

COPY demo /usr/src/demo

WORKDIR /usr/src/demo

CMD [ "bash" ]

EXPOSE 4567
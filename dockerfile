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

CMD [ "bash" ]

EXPOSE 4567
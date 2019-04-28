FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y ruby vim

CMD irb
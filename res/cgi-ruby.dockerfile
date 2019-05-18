FROM ubuntu

RUN apt-get update \
    && apt-get install -y apache2 curl ruby \
    && a2enmod cgid

CMD apachectl -D FOREGROUND

EXPOSE 80
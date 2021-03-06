FROM ubuntu:18.04

ENV CONTAINER DOCKER
ENV DEBIAN_FRONTEND noninteractive

# Webserver setup
RUN apt-get update && apt-get install -y \
        apache2 php libapache2-mod-php
WORKDIR /etc/apache2/sites-available
RUN echo "<VirtualHost *:80>"           > putzplan.conf && \
    echo "DocumentRoot /var/www/html"  >> putzplan.conf && \
    echo "Alias /build /var/www/build" >> putzplan.conf && \
    echo "</VirtualHost>"              >> putzplan.conf
RUN a2dissite 000-default.conf && \
    a2ensite putzplan.conf

# Install program dependencies
RUN apt-get update && apt-get install -y \
        make g++ \
        libboost-date-time-dev libboost-program-options-dev \
        texlive texlive-lang-german

# Copy program files
WORKDIR /var/www
ADD . /var/www/html
RUN mkdir -p /var/www/build && \
    chown www-data:www-data /var/www/build

EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND

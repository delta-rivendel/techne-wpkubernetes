FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
#ENV GIT_ASKPASS /etc/nginx/git_passwd.sh
#ENV GIT_PASSWORD OZ2WZIO6pKnDR+3gD5DeLGh2nbifg+m0qFhoL9LIzLw=
#ENV GIT_USER delta-rivendel

RUN apt update -y
RUN apt-get install -y nginx vim git locales php-pear php-apcu php-cli \
  php-common php-curl php-fpm php-gd php-imagick php-imap php-intl \
  php-json php-ldap php-memcache php-mysqlnd php-pspell \
  php-readline php-recode php-snmp php-tidy php-xmlrpc \
  php-xsl php-zip supervisor php-dev libmcrypt-dev
RUN yes "" | pecl install mcrypt-1.0.1

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN dpkg-reconfigure locales

COPY supervisord.conf /etc/supervisor

COPY snippets /etc/nginx/snippets

COPY www.conf /etc/php/7.2/fpm/pool.d

#COPY fix_site.sh /etc/nginx/fix_site.sh

#COPY git_passwd.sh /etc/nginx/git_passwd.sh

#RUN chmod +x /etc/nginx/*.sh

RUN rm -rf /etc/nginx/sites-available/*

RUN rm -rf /etc/nginx/sites-enabled/*

COPY lyceum.conf /etc/nginx/conf.d

RUN mkdir -p /usr/share/nginx/lyceum

COPY start.sh /start.sh

RUN chmod +x /start.sh

RUN mkdir -p /var/run/php

CMD ["./start.sh"]

EXPOSE 80

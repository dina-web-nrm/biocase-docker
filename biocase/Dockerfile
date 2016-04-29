FROM python:2.7
MAINTAINER markus.skyttner@nrm.se

RUN apt-get update && apt-get install -y apache2 net-tools

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN svn checkout http://ww2.biocase.org/svn/bps2/trunk biocase
ADD credentials.cfg /usr/src/app
ADD biocase.conf /etc/apache2/sites-available

RUN a2ensite biocase.conf
RUN a2enmod cgi


WORKDIR /
ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]

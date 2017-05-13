FROM eboraas/debian:stable
MAINTAINER Falko Gloeckler <falko.gloeckler@mfn-berlin.de>

RUN apt-get update
RUN apt-get -y install apache2 vim wget subversion python libapache2-mod-python libapache2-mod-wsgi python-lxml libxml2  python-libxml2 python-mysqldb python-psycopg2 python-sqlite python-pymssql python-pyodbc default-jre graphviz
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2

RUN /usr/sbin/a2ensite default-ssl
RUN /usr/sbin/a2enmod ssl
RUN /usr/sbin/a2dismod python
RUN /usr/sbin/a2enmod wsgi
RUN /usr/sbin/a2enmod cgid

RUN cd /opt/ && svn co http://ww2.biocase.org/svn/bps2/branches/stable biocase

COPY apache2-foreground /usr/local/bin/
COPY config-biocase /usr/local/bin/

RUN  chmod +x /usr/local/bin/apache2-foreground	
RUN  chmod +x /usr/local/bin/config-biocase

EXPOSE 80
EXPOSE 443

CMD ["/usr/local/bin/apache2-foreground", "-D", "FOREGROUND"]

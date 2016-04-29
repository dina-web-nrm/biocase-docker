FROM python:2.7
MAINTAINER markus.skyttner@nrm.se

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD credentials.cfg /usr/src/app

ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["python", "-h"]

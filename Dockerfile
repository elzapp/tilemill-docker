FROM ubuntu:14.04
MAINTAINER Bård Aase "bard@kvidder.com"
RUN apt-get update
RUN apt-get upgrade
RUN apt-get -y install python-software-properties software-properties-common
RUN yes | apt-add-repository ppa:developmentseed/mapbox
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install --yes tilemill
RUN echo '{"server":true,"listenHost": "0.0.0.0"}' > /etc/tilemillconfig.json
CMD /usr/share/tilemill/index.js start --config=/etc/tilemillconfig.json
EXPOSE 20009
EXPOSE 20008
VOLUME ["/Documents"]

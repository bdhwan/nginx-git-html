FROM ubuntu:16.04
MAINTAINER bdhwan@gmail.com


RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y nginx 
RUN apt-get install -y curl 
RUN rm -rf /etc/nginx/sites-available/default
ADD default /etc/nginx/sites-available/default
ADD check.sh /home/check.sh
RUN chmod 777 /home/check.sh
WORKDIR /home
HEALTHCHECK --interval=60s --timeout=3s --retries=60 CMD curl --fail http://localhost || exit 1
ENTRYPOINT ["/bin/sh", "check.sh"]


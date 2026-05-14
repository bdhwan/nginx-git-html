FROM bdhwan/nginx-git-ngx-html:0.0.1

ADD ./ssl /etc/nginx/ssl
RUN chmod 755 -R /etc/nginx/ssl

RUN rm -rf /etc/nginx/sites-available/default
ADD default /etc/nginx/sites-available/default


WORKDIR /home

ADD ./check.sh /home/check.sh

EXPOSE 8080 80 443 3000 
HEALTHCHECK --interval=10s --timeout=3s --retries=100 CMD curl --fail http://localhost/index.html || exit 1
ENTRYPOINT ["/bin/sh", "check.sh"]


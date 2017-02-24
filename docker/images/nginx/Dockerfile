FROM nginx:1.11.10

RUN apt-get update \
    && apt-get install --no-install-recommends -y python python-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install Jinja2

ADD . /scripts

RUN chmod +x /scripts/docker-entrypoint.sh

ENTRYPOINT ["/scripts/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
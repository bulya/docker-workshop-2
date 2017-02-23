FROM python:3.5.3

ENV PYTHONUNBUFFERED 1

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates curl \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

ADD ./docker/images/django/docker-entrypoint.sh /scripts/docker-entrypoint.sh
RUN chmod +x /scripts/docker-entrypoint.sh

RUN mkdir /code
ADD ./api/requirements /code/requirements

RUN pip install -r /code/requirements/dev.txt

WORKDIR /code

ENTRYPOINT ["/scripts/docker-entrypoint.sh"]

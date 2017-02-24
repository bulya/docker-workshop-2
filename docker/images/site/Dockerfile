FROM node:6.9.5

RUN apt-get update \
    && apt-get install -y --no-install-recommends ruby-full \
    && rm -rf /var/lib/apt/lists/* \
    && gem install sass compass rubygems-update \
    && npm install -g gulp bower node-gyp

ADD ./site/package.json /code/package.json

WORKDIR /code

RUN npm install

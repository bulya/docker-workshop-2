FROM postgres:9.6.2

# Install postgis extension
#RUN apt-get update \
#    && apt-get install --no-install-recommends -y postgis postgresql-9.6-postgis-2.3 postgresql-9.6-postgis-2.3-scripts  \
#    && rm -rf /var/lib/apt/lists/*

# Add backup scripts
ADD backup.sh /usr/local/bin/backup
ADD restore.sh /usr/local/bin/restore
ADD list-backups.sh /usr/local/bin/list-backups

# Make them executable
RUN chmod +x /usr/local/bin/restore \
    && chmod +x /usr/local/bin/list-backups \
    && chmod +x /usr/local/bin/backup

# Add script create extension
#ADD ./create-extension.sh /docker-entrypoint-initdb.d/create-extension.sh

ADD ./docker-entrypoint.sh /scripts/docker-entrypoint.sh

VOLUME /backups

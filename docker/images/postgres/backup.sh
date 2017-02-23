#!/bin/bash
# stop on errors
set -e

# we might run into trouble when using the default `postgres` user, e.g. when dropping the postgres
# database in restore.sh. Check that something else is used here
if [ "$POSTGRES_USER" == "postgres" ]
then
    echo "Creating a backup as the postgres user is not supported, make sure to set the POSTGRES_USER environment variable"
    exit 1
fi

# export the postgres password so that subsequent commands don't ask for it
export PGPASSWORD=$POSTGRES_PASSWORD

FILENAME=$(date +'%Y-%m-%dT%H:%M:%S').psql.gz
CURRENT_DIR=/backups/$(date +'%Y')/$(date +'%m')/$(date +'%d')

echo "Creating folders $CURRENT_DIR"
mkdir -p "$CURRENT_DIR"

echo "Creating backup $CURRENT_DIR/$FILENAME"

pg_dump --no-owner -h $POSTGRES_HOST -d $POSTGRES_DB -U $POSTGRES_USER | gzip > $CURRENT_DIR/$FILENAME

echo "Successfully created backup $CURRENT_DIR/$FILENAME"

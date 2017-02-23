#!/bin/bash

export PGPASSWORD=$POSTGRES_PASSWORD

echo 'CREATE EXTENSION postgis'
psql -U $POSTGRES_USER $POSTGRES_DB -c 'CREATE EXTENSION postgis;'
echo 'CREATE EXTENSION postgis_topology'
psql -U $POSTGRES_USER $POSTGRES_DB -c 'CREATE EXTENSION postgis_topology;'

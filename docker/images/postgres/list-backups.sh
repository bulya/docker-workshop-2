#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "Listing dirs"
    find /backups -type d
    exit 1
fi

echo "Listing available backups"
find $1 -name '*.psql.gz' | sort -n

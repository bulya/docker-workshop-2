#!/bin/bash
cd /scripts

python generate.py && exec "$@"

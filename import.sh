#!/usr/bin/env bash

cat dump.sql | docker exec -i unleash_pg_1 psql -Udemo -dpostgres

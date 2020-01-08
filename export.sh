#!/usr/bin/env bash

export $(cat .env | xargs)
docker exec -it unleash_pg_1 bash -c "pg_dump --dbname=postgresql://$DB_USER:$DB_PASSWORD@127.0.0.1:5432/postgres" > dump.sql

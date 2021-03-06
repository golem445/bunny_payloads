#!/bin/bash

cat <<EOF> /opt/pg-utf8.sql
update pg_database set datallowconn = TRUE where datname = 'template0';
\c template0
update pg_database set datistemplate = FALSE where datname = 'template1';
drop database template1;
create database template1 with template = template0 encoding = 'UTF8';
update pg_database set datistemplate = TRUE where datname = 'template1';
\c template1
update pg_database set datallowconn = FALSE where datname = 'template0';
\q
EOF
postgres psql -f /opt/pg-utf8.sql &&
postgres createuser msfdev -dRS &&
postgres psql -c \
  "ALTER USER msfdev with ENCRYPTED PASSWORD 'RedvsBlue';" &&
postgres createdb --owner msfdev msf_dev_db &&
postgres createdb --owner msfdev msf_test_db &&
cat <<EOF> /opt/database.yml

# Development Database
development: &pgsql
  adapter: postgresql
  database: msf_dev_db
  username: msfdev
  password: RedvsBlue
  host: localhost
  port: 5432
  pool: 5
  timeout: 5

# Production database -- same as dev
production: &production
  <<: *pgsql

# Test database -- not the same, since it gets dropped all the time
test:
  <<: *pgsql
  database: msf_test_db
EOF
# echo "Manually move /opt/database.yml to $HOME/.msf4/database.yml"


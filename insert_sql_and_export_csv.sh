#!/bin/bash

DB_NAME="db.sqlite3"
SEED_FILE="in/seed.sql"

rm $DB_NAME
touch $DB_NAME
sqlite3 $DB_NAME < $SEED_FILE

TABLES=$(sqlite3 $DB_NAME .tables)
for TABLE in ${TABLES[@]}; do
  sqlite3 $DB_NAME -header -csv "select * from ${TABLE}" > "out/${TABLE}.csv"
done

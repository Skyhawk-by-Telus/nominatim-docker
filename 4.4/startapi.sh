#!/bin/bash

# Custom shim to start the nominatim Apache server based on config values from the ECS TaskDefinition
# $DB_IP and $DB_PSWD must be injected as environment variables

mkdir -p /data

export REPLICATION_URL="http://download.geofabrik.de/north-america-updates/"
export DB_DSN="pgsql:host=$DB_IP;port=6432;user=nominatim;password=$NOMINATIM_PASSWORD;dbname=nominatim"

[ ! -f /data/local.php ] && cp /app/local-template.php /data/local.php

sed -i \
    -e "s,{DB_DSN},$DB_DSN,g" \
    -e "s,{REPLICATION_URL},$REPLICATION_URL,g" \
    /data/local.php \

cat /data/local.php

cd /nominatim
export NOMINATIM_DATABASE_DSN="$DB_DSN"
nominatim refresh --website

chmod +x /app/startapache.sh
/app/startapache.sh


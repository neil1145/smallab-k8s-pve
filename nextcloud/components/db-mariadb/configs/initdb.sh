#!/bin/sh
echo ">>> Creating user for Mysql Prometheus metrics exporter"
mysql -u root -p$MYSQL_ROOT_PASSWORD --execute \
"CREATE USER '${MARIADB_PROMETHEUS_EXPORTER_USERNAME}'@'localhost' IDENTIFIED BY '${MARIADB_PROMETHEUS_EXPORTER_PASSWORD}' WITH MAX_USER_CONNECTIONS 3;
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO '${MARIADB_PROMETHEUS_EXPORTER_USERNAME}'@'localhost';
FLUSH privileges;"
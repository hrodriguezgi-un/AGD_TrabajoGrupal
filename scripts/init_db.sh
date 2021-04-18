#!/bin/sh

# Install dos2unix utility to avoid Windows problems with files
apt-get update && apt-get install dos2unix
dos2unix /var/lib/mysql-files/*.csv

# Grant access from real machine
mysql -uroot -ppassword < /var/lib/mysql-files/init_db.sql

# Load information to database
mysql -uroot -ppassword < /var/lib/mysql-files/hospitalizacion.sql
mysql -uroot -ppassword < /var/lib/mysql-files/load_data.sql
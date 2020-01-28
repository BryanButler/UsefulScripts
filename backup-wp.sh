#!/bin.bash
#
#This script runs a backup for the wordpress sites placed here
#
#Execute using the following command
# bash  backup-wp.sh
#
sqltgt=$(basename $(pwd))
timestamp(){
  date +"%Y%m%d"
}
ts=$(timestamp)
lwts=$(date -d "$(timestamp) -7 days" +"%Y%m%d")
rm /var/www/html/wp-dbs/${sqltgt}${lwts}
wp db export /var/www/html/wp-dbs/${sqltgt}${ts}.sql --allow-root


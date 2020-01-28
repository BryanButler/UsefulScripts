#!/bin.bash
#
#This script moves databases and content folders from one destination to another
#
#Execute using the following command
# bash  push-pull-wp.sh
#

read -p 'Which site would you like to start with as your base: ' basevar

mkdir tmpdb
cd /var/www/html/${basevar}
wp db export /var/www/html/tmpdb/${basevar}.sql  --add-drop-table --allow-root

read -p 'Which site would you like to push your site to: ' pushvar

cd /var/www/html/${pushvar}
wp db import /var/www/html/tmpdb/${basevar}.sql --allow-root

baseurl= #place the name of your server here
basetarget="${baseurl}${basevar}/"
pushtarget="${baseurl}${pushvar}/"
wp search-replace --url  "${basetarget}" "${pushtarget}" --allow-root

##Moving the content files
cd /var/www/html/
pwd
rm -rf ${pushvar}/wp-content
cp -r ${basevar}/wp-content ${pushvar}/wp-content
rm -rf tmpdb

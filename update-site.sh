#!/bin/bash:
#
#This script runs updates for the site based on the user input
#

# you run this command by by using "bash update-site.sh"

read -p 'Which site folder would you like to run updates on? ' foldervar

cd /var/www/html/${foldervar}
echo 'checking current version...'
wp core version --allow-root
echo 'updating core...'
wp core update --allow-root
wp core update --minor  --allow-root
echo 'new core version'
wp core version --allow-root
echo 'checking for plugin updates'
wp plugin update --dry-run --all --allow-root
echo 'updatating those plugins...'
wp plugin update --all --allow-root

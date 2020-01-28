#!/bin.bash
#! execute the command with bash grav-permissions.sh
read -p 'What is the directory of the grav site you would like to run permisssions on: ' gravdir
cd /var/www/html/${gravdir} 
chown -R bab84:apache .
find . -type f | xargs chmod 664
find ./bin -type f | xargs chmod 775
find . -type d | xargs chmod 775
find . -type d | xargs chmod +s
#cd ./cache
#chown apache:apache -R .
#!find . -type f -exec chmod 664 {} \;
#!find ./bin -type d -exec chmod 775 {} \;
#!find . -type d -exec chmod 664 {} \;

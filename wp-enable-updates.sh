#!/bin.bash
#
#This script sets the permissions for the wordpress sites you place here
#
#Execute using the following command
# bash wordpress-permissions.sh /var/www/html/<site folder>
#
OWNER=apache # <-- wordpress owner
GROUP=apache
ROOT=$1

# reset to safe defaults
find ${ROOT} -exec chown ${OWNER}:${GROUP} {} \;
find ${ROOT} -type d -exec chmod 755 {} \;
find ${ROOT} -type f -exec chmod 644 {} \;
 
# allow wordpress to manage wp-config.php (but prevent world access)
chgrp ${GROUP} ${ROOT}/wp-config.php
chmod 660 ${ROOT}/wp-config.php
 
# allow wordpress to manage wp-content
find ${ROOT}/wp-content -exec chgrp ${GROUP} {} \;
find ${ROOT}/wp-content -type d -exec chmod 775 {} \;
find ${ROOT}/wp-content -type f -exec chmod 664 {} \;

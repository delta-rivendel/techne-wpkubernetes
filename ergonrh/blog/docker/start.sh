#!/bin/bash
WP_PATH="/usr/share/nginx/blog_ergonrh"
find $WP_PATH -type f -not -path "*wp-content*" -exec chmod 644 {} \;
find $WP_PATH -type f -not -path "*wp-content*" -exec chown www-data:www-data {} \;
find $WP_PATH -type d -not -path "*wp-content*" -exec chmod 755 {} \;
chmod 600 $WP_PATH/wp-config.php
find $WP_PATH -type d -not -path "*wp-content*" -exec chown www-data:www-data {} \;

service php7.2-fpm start
#/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
nginx -g 'daemon off;'

#!/usr/bin/env bash
project_name=wordpress
locale=en_US
admin_name=$project_name
admin_password=$project_name
title=$project_name
url=docker.${project_name}
admin_email=admin@${url}

echo "DOWNLOADING WORDPRESS"
#remove existing wordpress files used by the original  image template ("wordpress")
#https://stackoverflow.com/a/17902999/4721232
files=$(shopt -s nullglob dotglob; echo /var/www/html/*)
if (( ${#files} ));then
  rm -r /var/www/html/*
fi
cd /var/www/html && wp core download --locale=$locale --allow-root

echo "SETTING UP WP-CONFIG.PHP"
wp config create --allow-root --dbhost=${project_name}_mysql --dbname=$project_name --dbuser=$project_name --dbpass=$project_name --locale="$locale" --extra-php <<PHP
/**
 * This will log all errors notices and warnings to a file called debug.log in wp-content
 * ( you might need to create the file first and set the appropriate permissions (i.e. use 666) )
 */
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', true);
@ini_set('display_errors', 1);

define('FORCE_SSL_LOGIN', true);
define('FORCE_SSL_ADMIN', true);
define( 'CONCATENATE_SCRIPTS', false );
define( 'SCRIPT_DEBUG', true );
PHP

echo "SETTING UP SITE"
wp core install --allow-root --url=$url --title="$title" --admin_name="$admin_name" --admin_password="$admin_password" --admin_email="$admin_email"


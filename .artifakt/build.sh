#!/bin/bash

set -e

echo ">>>>>>>>>>>>>> START CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "

echo "------------------------------------------------------------"
echo "The following build args are available:"
env
echo "------------------------------------------------------------"

# NO SCRIPTS, it breaks the build
# see https://stackoverflow.com/a/61349991/1093649
composer --no-ansi --no-interaction update --no-cache --no-progress  --no-autoloader --no-scripts

echo "export APP_ENV=$APP_ENV" >> /etc/apache2/envvars
echo "export APP_DEBUG=$APP_DEBUG" >> /etc/apache2/envvars

cp /.artifakt/000-default.conf /etc/apache2/sites-enabled/000-default.conf

rm -rf /var/www/html/var/ && \
    mkdir -p /data/var/log /data/var/uploads && \
    ln -s /data/var /var/www/html/var

composer require symfony/apache-pack

chown -R www-data:www-data /var/www/html/

echo ">>>>>>>>>>>>>> END CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "

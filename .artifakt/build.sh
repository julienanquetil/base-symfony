#!/bin/bash

set -e

echo ">>>>>>>>>>>>>> START CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "

echo "------------------------------------------------------------"
echo "The following build args are available:"
env
echo "------------------------------------------------------------"

# NO SCRIPTS, it breaks the build
# see https://stackoverflow.com/a/61349991/1093649
composer --no-ansi --no-interaction update --no-cache --no-progress  --no-autoloader --no-scripts --no-dev

chown -R www-data:www-data /var/www/html/

echo ">>>>>>>>>>>>>> END CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "

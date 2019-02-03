#! /bin/bash
. `dirname $0`/../.laradock/init.sh

docker exec -ti "$LARADOCK_PROJECT_NAME"_php-fpm_1 bash

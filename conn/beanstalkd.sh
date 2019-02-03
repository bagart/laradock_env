#! /bin/bash
. `dirname $0`/../.laradock/init.sh

docker exec -ti "$LARADOCK_PROJECT_NAME"_beanstalkd_1 bash

#! /bin/bash
. `dirname $0`/../.laradock/init.sh

docker exec -ti "$LARADOCK_PROJECT_NAME"_postgres_1 bash

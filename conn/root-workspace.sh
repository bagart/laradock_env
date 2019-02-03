#! /bin/bash
. `dirname $0`/../.laradock/init.sh

docker exec -ti "$LARADOCK_PROJECT_NAME"_workspace_1 bash

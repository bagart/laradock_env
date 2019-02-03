#! /bin/bash
. `dirname $0`/../.laradock/init.sh
echo "---------- Laradock app install composer: $LARADOCKENV_PROJECT_NAME ----------"

docker exec --user=laradock -it "$LARADOCK_PROJECT_NAME"_workspace_1 bash -c 'composer install'


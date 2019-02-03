#! /bin/bash
. `dirname $0`/../.laradock/init.sh
echo "---------- Laradock app install db migrations: $LARADOCKENV_PROJECT_NAME ----------"

$LARADOCKENV_PATH/app/install-db.sh

docker exec --user=laradock -it "$LARADOCK_PROJECT_NAME"_workspace_1 bash -c 'php ./artisan db:seed'

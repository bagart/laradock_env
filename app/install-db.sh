#! /bin/bash
. `dirname $0`/../.laradock/init.sh
echo "---------- Laradock app install db migrations: $LARADOCKENV_PROJECT_NAME ----------"

if [ ! -d "vendor" ]; then
    $LARADOCKENV_PATH/app/install-composer.sh
fi

docker exec --user=laradock -it "$LARADOCK_PROJECT_NAME"_workspace_1 bash -c 'php ./artisan migrate'

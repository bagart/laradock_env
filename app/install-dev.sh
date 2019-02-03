#! /bin/bash
. `dirname $0`/../.laradock/init.sh
echo "---------- Laradock app install DEV with seed: $LARADOCKENV_PROJECT_NAME ----------"

$LARADOCKENV_PATH/app/install-composer.sh
$LARADOCKENV_PATH/app/install-db-seed.sh

#! /bin/bash
. `dirname $0`/.laradock/init.sh

echo "---------- Laradock UP: $LARADOCKENV_PROJECT_NAME ($LARADOCK_PROJECT_SERVICES) ----------"

if [ -f $LARADOCK_PATH/docker-compose.yml ]; then
    cd $LARADOCK_PATH
        docker-compose up -d $LARADOCK_PROJECT_SERVICES
    cd $LARADOCK_CURRENT_PATH
else
    $LARADOCKENV_PATH/install.sh
fi

$LARADOCKENV_PATH/ps.sh

if [[ "$1" != "-" ]]; then
    $LARADOCKENV_PATH/conn.sh workspace
fi

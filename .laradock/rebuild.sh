#! /bin/bash
. "`dirname $0`/init.sh"
echo "---------- Laradock rebuild $1 $2 $3: $LARADOCKENV_PROJECT_NAME  ----------"

LARADOCK_DBG=1;
if [[ "$1" == "--silence" || "$2" == "--silence" || "$3" == "--silence" ]]; then
    LARADOCK_DBG=0;
fi

$LARADOCKENV_PATH/.laradock/rebuild_containers.sh $1 $2 $3

$LARADOCKENV_PATH/up.sh -
$LARADOCKENV_PATH/app/install-db-seed.sh
if [[ "$LARADOCK_DBG" != "0" ]]; then
    $LARADOCKENV_PATH/ps.sh
fi

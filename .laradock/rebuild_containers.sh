#! /bin/bash
. "`dirname $0`/init.sh"

LARADOCK_DBG=1;
if [[ "$1" == "--silence" || "$2" == "--silence" || "$3" == "--silence" ]]; then
    LARADOCK_DBG=0;
fi

LARADOCK_REBUILD_FIX=0;
if [[ "$1" == "--fix" || "$2" == "--fix" || "$3" == "--fix" ]]; then
    LARADOCK_REBUILD_FIX=1;
fi

$LARADOCKENV_PATH/.laradock/rm_containers.sh $1 $2 $3

cd $LARADOCK_PATH
    LARADOCK_REBUILD_FILTER='cat'
    if [[ "$LARADOCK_DBG" == "0" ]]; then
        LARADOCK_REBUILD_FILTER='grep -v ^\s---'
    fi

    LARADOCK_REBUILD_PARAM=''
    if [[ "$LARADOCK_REBUILD_FIX" == "1" ]]; then
        # VERY SLOW
        LARADOCK_REBUILD_PARAM=' --no-cache '
    fi

    echo ---------- Laradock rebuild $LARADOCK_REBUILD_PARAM: $LARADOCK_PROJECT_SERVICES ----------
    docker-compose build $LARADOCK_REBUILD_PARAM --pull $LARADOCK_PROJECT_SERVICES | $LARADOCK_REBUILD_FILTER
cd $LARADOCK_CURRENT_PATH

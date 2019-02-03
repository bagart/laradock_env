#! /bin/bash
. "`dirname $0`/init.sh"
echo "---------- Laradock rebuild: $LARADOCKENV_PROJECT_NAME ----------"

LaraDock_DBG=1;
if [[ "$1" == "--silence" || "$2" == "--silence" ]]; then
    LaraDock_DBG=0;
fi
LaraDock_STOP=1;
if [[ "$1" == "--stopped" || "$2" == "--stopped" ]]; then
    LaraDock_STOP=0;
fi

cd $LARADOCK_PATH
    if [[ "$LaraDock_STOP" == "1" ]]; then
        docker-compose stop
    fi
	docker-compose rm -f
	rm -rf .data
    LaraDock_PARAM='cat'
    if [[ "$LaraDock_DBG" == "0" ]]; then
        LaraDock_PARAM='grep -v ^\s---'
    fi
    echo ---------- rebuild: $LARADOCK_PROJECT_SERVICES ----------
    docker-compose build --pull $LARADOCK_PROJECT_SERVICES | $LaraDock_PARAM
cd $PROJECT_PATH

$LARADOCKENV_PATH/up.sh -
$LARADOCKENV_PATH/app/install-db-seed.sh
if [[ "$LaraDock_DBG" != "0" ]]; then
    $LARADOCKENV_PATH/ps.sh
fi

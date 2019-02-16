#! /bin/bash
. "`dirname $0`/init.sh"
echo "---------- Laradock rebuild: $LARADOCKENV_PROJECT_NAME ----------"

LaraDock_DBG=1;
if [[ "$1" == "--silence" || "$2" == "--silence" || "$3" == "--silence" ]]; then
    LaraDock_DBG=0;
fi

LaraDock_STOP=1;
if [[ "$1" == "--stopped" || "$2" == "--stopped" || "$3" == "--stopped" ]]; then
    LaraDock_STOP=0;
fi

LaraDock_FIX=0;
if [[ "$1" == "--fix" || "$2" == "--fix" || "$3" == "--fix" ]]; then
    LaraDock_FIX=1;
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

    LaraDockEnv_BUILD_PARAM=''
    if [[ "$LaraDock_FIX" == "1" ]]; then
        # VERY SLOW
        LaraDockEnv_BUILD_PARAM=' --no-cache '
    fi

    echo ---------- rebuild$LaraDockEnv_BUILD_PARAM: $LARADOCK_PROJECT_SERVICES ----------
    docker-compose build $LaraDockEnv_BUILD_PARAM --pull $LARADOCK_PROJECT_SERVICES | $LaraDock_PARAM
cd $PROJECT_PATH

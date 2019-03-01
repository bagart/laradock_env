#! /bin/bash
. "`dirname $0`/init.sh"

if [ -d "_env" ]; then
    echo "---------- Laradock customize: $LARADOCKENV_PROJECT_NAME ----------"

    LaraDock_ENV_CUR=dev
    if [[ "$1" != "" ]]; then
        LaraDock_ENV_CUR=$1;
    else
        if [[ "$LaraDock_ENV" != "" ]]; then
            LaraDock_ENV_CUR=$LaraDock_ENV;
        fi
    fi

    if [ -d "_env/default" ]; then
        echo "---------- prepare ENV: default -----------"
        cp -r _env/default/* ./
    fi

    if [ -d "_env/$LaraDock_ENV_CUR" ]; then
        echo "---------- prepare ENV: $LaraDock_ENV_CUR -----------"
        cp -r _env/$LaraDock_ENV_CUR/* ./
    fi

    if [ -f "../laradock_$LARADOCKENV_PROJECT_NAME/prepare.sh" ]; then
        echo "---------- prepare LARADOCK -----------"
        cd $LARADOCK_PATH
            ./prepare.sh
        cd $LARADOCK_CURRENT_PATH
    fi
fi

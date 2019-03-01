#! /bin/bash
. `dirname $0`/../.laradock/init.sh

if [[ "$1" != "" ]]; then
    if [[ -d $LARADOCK_PATH/$1 ]]; then
        echo "---------- Laradock: purge $1 ----------"
        cd $LARADOCK_PATH
            docker-compose stop $1
            docker-compose rm -f $1
            rm -rf .data/$1
            docker-compose up -d $1
        cd $LARADOCK_CURRENT_PATH
    else
        echo Laradock service $1 is not exist
    fi
else
    echo For purge Laradock container: purge.sh $service
    echo Use example:
    echo "  - purge.sh beanstalkd"
    echo "  - purge.sh postgres"
fi

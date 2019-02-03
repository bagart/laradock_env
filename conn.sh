#! /bin/bash
. `dirname $0`/.laradock/init.sh

if [[ "$1" != "" ]]; then
    if [[ -d $LARADOCK_PATH/$1 ]]; then
        echo "---------- Laradock: connection to $1 ----------"
        CONTAINER_USER_NAME=root
        if [[ "$1" == "workspace" && "$2" == "" ]]; then
             CONTAINER_USER_NAME=laradock
        fi
        docker exec --user=laradock -it ${LARADOCK_PROJECT_NAME}_${1}_1 bash
    else
        echo Laradock service $1 is not exist
    fi
else
    echo For connect to Laradock container: conn.sh $service
    echo Use example:
    echo "  - conn.sh workspace"
    echo "  - conn.sh workspace root"
    echo "  - conn.sh workspace laradock"
    echo "  - conn.sh postgres"
fi

#! /bin/bash
. `dirname $0`/.laradock/init.sh

cd $LARADOCK_PATH
    docker-compose stop
cd $PROJECT_PATH

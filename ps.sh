#! /bin/bash
. `dirname $0`/.laradock/init.sh

cd $LARADOCK_PATH
    docker-compose ps
cd $LARADOCK_CURRENT_PATH

#! /bin/bash
. `dirname $0`/.laradock/init.sh

cd $LARADOCK_PATH
    docker-compose logs -f $1 | grep -v " schedule:run >> /dev/null 2>&1"
cd $LARADOCK_CURRENT_PATH

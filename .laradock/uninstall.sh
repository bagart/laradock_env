#! /bin/bash
. "`dirname $0`/init.sh"

if [ -d $LARADOCK_PATH ]; then
    echo "---------- Laradock uninstall and remove ----------"
    cd $LARADOCK_PATH
        docker-compose stop
        docker-compose rm -f
    cd $LARADOCK_CURRENT_PATH
    rm -rf $LARADOCK_PATH
else
    echo "---------- Laradock uninstall is not needed ----------"
fi

echo "---------- List of All Dockers on machine ----------"
docker ps

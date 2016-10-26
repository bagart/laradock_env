#! /bin/bash

REBUILD="workspace php-fpm nginx elasticsearch beanstalkd mysql"
#if [[ "$1" == "full" ]]; then
#    REBUILD="workspace php-fpm nginx elasticsearch beanstalkd mysql"
#else
#    OS_TYPE=$(expr substr $(uname -s) 1 5)
#fi
cd laradock
    docker-compose stop $REBUILD
    docker-compose pull
    docker-compose build
    docker-compose up -d workspace php-fpm
    ./xdebugPhpFpm start
    ./xdebugPhpCli start laravel
cd ..
cmd/up.sh

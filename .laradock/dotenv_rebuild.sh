#! /bin/bash
. "`dirname $0`/init.sh"
echo "---------- Laradock set env: $LARADOCKENV_PROJECT_NAME ----------"

cd $LARADOCK_PATH
    cp env-example .env
    sed -i "s#^APP_CODE_PATH_HOST=.*#APP_CODE_PATH_HOST=$LARADOCK_PROJECT_PATH#" .env
    sed -i "s#^COMPOSE_PROJECT_NAME=.*#COMPOSE_PROJECT_NAME=$LARADOCK_PROJECT_NAME#" .env
    sed -i "s#^DATA_PATH_HOST=.*#DATA_PATH_HOST=.data#" .env

    #dev by design
    sed -i "s/^WORKSPACE_INSTALL_XDEBUG=.*/WORKSPACE_INSTALL_XDEBUG=true/" .env
    sed -i "s/^PHP_FPM_INSTALL_XDEBUG=.*/PHP_FPM_INSTALL_XDEBUG=true/" .env

    if [[ $DOCKERHOST_OS = "Cygwin" || $DOCKERHOST_OS = "MinGw" ]]; then
        # If you are using Docker Sync. For `osx` use 'native_osx', for `windows` use 'unison', for `linux` docker-sync is not required
        sed -i "s#^DOCKER_SYNC_STRATEGY=.*#DOCKER_SYNC_STRATEGY=unison#" .env

        # Change the separator from : to ; on Windows
        sed -i "s#^COMPOSE_PATH_SEPARATOR=.*#COMPOSE_PATH_SEPARATOR=;#" .env

        # Alternative: Repair windows permissions
        #sed -i 's#^\( *\-\) \(${\(APP_CODE_PATH_HOST\|DATA_PATH_HOST\)}\)#\1 d:\2#' docker-compose.yml
    fi;

    if [[ $DOCKERHOST_OS = "Mac" ]]; then
        # If you are using Docker Sync. For `osx` use 'native_osx', for `windows` use 'unison', for `linux` docker-sync is not required
        # default: native_osx
        sed -i "s#^DOCKER_SYNC_STRATEGY=.*#DOCKER_SYNC_STRATEGY=native_osx#" .env
        # default: :
        sed -i "s#^COMPOSE_PATH_SEPARATOR=.*#COMPOSE_PATH_SEPARATOR=:#" .env
    fi;

cd $LARADOCK_CURRENT_PATH

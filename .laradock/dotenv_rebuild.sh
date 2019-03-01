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

    #if [[ $DOCKERHOST_OS != "Linux" && $DOCKERHOST_OS != "Mac" ]]; then
    #    # Repair windows permissions
    #    sed -i "s#^\( *\-\) \($.*_PORT.*\)\$#\1 \"\2\"#" docker-compose.yml
    #    sed -i "s#^\( *\-\) \($.*\)\$#\1 d:\2#" docker-compose.yml
    #fi;
cd $LARADOCK_CURRENT_PATH
exit

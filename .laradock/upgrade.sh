#! /bin/bash
. "`dirname $0`/init.sh"

if [ -d $LARADOCK_PATH ]; then
    echo "---------- Laradock Upgrade: $LARADOCKENV_PROJECT_NAME ----------"
    $LARADOCKENV_PATH/stop.sh
	cd $LARADOCK_PATH
        git reset --hard origin/master
        git pull
	cd $LARADOCK_CURRENT_PATH
else
    echo "---------- Laradock 1st init: $LARADOCKENV_PROJECT_NAME ----------"
    git clone https://github.com/LaraDock/laradock.git $LARADOCK_PATH
    cd $LARADOCK_PATH
        cp env-example .env
    cd $LARADOCK_CURRENT_PATH
fi

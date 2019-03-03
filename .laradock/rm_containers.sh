#! /bin/bash
. "`dirname $0`/init.sh"
echo "---------- Laradock rm: $LARADOCKENV_PROJECT_NAME ----------"

LaraDock_STOP=1;
if [[ "$1" == "--stopped" || "$2" == "--stopped" || "$3" == "--stopped" ]]; then
    LaraDock_STOP=0;
fi


cd $LARADOCK_PATH
    if [[ "$LaraDock_STOP" == "1" ]]; then
        docker-compose stop
    fi
	docker-compose rm -f
	rm -rf .data
cd $LARADOCK_CURRENT_PATH

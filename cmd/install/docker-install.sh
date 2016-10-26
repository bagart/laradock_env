#! /bin/bash

if [ -d "laradock" ]
then
    cmd/stop.sh
    cd laradock
        git reset --hard origin/master
        git pull
    cd ..
else
    git clone https://github.com/LaraDock/laradock.git
fi

cp -r _env/laradock/ ./
chmod a+rx laradock/xdebugPhp*

cmd/rebuild.sh

docker exec --user=laradock -it laradock_workspace_1 bash -c 'php ./artisan migrate'
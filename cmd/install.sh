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
cp -r _env/default/* ./

LaraDock_ENV_CUR=dev
if [[ "$1" != "" ]]; then
    LaraDock_ENV_CUR=$1;
else
    if [[ "$LaraDock_ENV" != "" ]]; then
        LaraDock_ENV_CUR=$LaraDock_ENV;
    fi
fi
echo "---------- prepare ENV: $LaraDock_ENV_CUR -----------"
cp -r _env/$LaraDock_ENV_CUR/* ./

cd laradock
    ./prepare.sh
cd ..

cmd/rebuild.sh --silence --stopped

#! /bin/bash
cd laradock/
    docker-compose stop beanstalkd
    docker-compose up -d beanstalkd
cd ..
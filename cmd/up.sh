#! /bin/bash
#cd ../docker-elk
#docker-compose up -d elasticsearch kibana logstash
#cd ../hinta

cd laradock
    docker-compose up -d nginx beanstalkd elasticsearch mysql
    #postgres
    docker-compose ps
cd ..
cmd/conn-workspace.sh         
 
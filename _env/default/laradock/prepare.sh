#! /bin/bash

chmod a+rx xdebugPhp*

cat workspace/Dockerfile.append >> workspace/Dockerfile

#sed -i -e 's/^\s*client_max_body_size.*/  client_max_body_size 100M;/' nginx/nginx.conf
#sed -i -e 's/include fastcgi_params/fastcgi_read_timeout 300;\n        include fastcgi_params/' nginx/sites/default.conf
#sed -i -e 's/^\s*memory_limit.*/memory_limit = 500M/' php-fpm/laravel.ini
#sed -i -e 's/^\s*post_max_size.*/post_max_size = 100M/' php-fpm/laravel.ini


#fix version
#sed -i -e 's/^\s*FROM elasticsearch.*/FROM elasticsearch:2.4.0/' elasticsearch/Dockerfile
#add admin tools
#echo RUN ./bin/plugin install http://dl.bintray.com/content/imotov/elasticsearch-plugins/org/elasticsearch/elasticsearch-analysis-morphology/2.4.0/elasticsearch-analysis-morphology-2.4.0.zip >> elasticsearch/Dockerfile
#echo RUN ./bin/plugin install mobz/elasticsearch-head >> elasticsearch/Dockerfile
#echo RUN ./bin/plugin install royrusso/elasticsearch-HQ >> elasticsearch/Dockerfile
#echo RUN ./bin/plugin install jettro/elasticsearch-gui >> elasticsearch/Dockerfile

#for v5
#echo RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install http://dl.bintray.com/content/imotov/elasticsearch-plugins/org/elasticsearch/elasticsearch-analysis-morphology/5.0.0/elasticsearch-analysis-morphology-5.0.0.zip >> elasticsearch/Dockerfile


#make fault-tolerance
#sed -i -e 's/^\s*CMD \[\"\/usr\/bin\/beanstalkd.*/CMD \["\/usr\/bin\/beanstalkd", "-b", "\/var\/lib\/beanstalkd"\]\n/' beanstalkd/Dockerfile

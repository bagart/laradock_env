FROM elasticsearch:2.4.0

MAINTAINER Bo-Yi Wu <appleboy.tw@gmail.com>

EXPOSE 9200 9300

RUN ./bin/plugin install mobz/elasticsearch-head
RUN ./bin/plugin install royrusso/elasticsearch-HQ
RUN ./bin/plugin install http://dl.bintray.com/content/imotov/elasticsearch-plugins/org/elasticsearch/elasticsearch-analysis-morphology/2.4.0/elasticsearch-analysis-morphology-2.4.0.zip


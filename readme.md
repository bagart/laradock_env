# Simple LaraDock tools and dev environments

#Install
copy to parrent path of your projects
edit _env/laradock/* files as you needed. 
add other docker-config, remove for default

run file://cmd/install/docker-install.sh

#use

-[cmd/install/docker-install.sh](cmd/install/docker-install.sh)  - 1st run. rebuild with new config

-[cmd/up.sh](cmd/up.sh) - run laradock containers with docker-list (in file) and connect to workspace

-[cmd/stop.sh](cmd/stop.sh) - stop all laradock container
  
  
-[cmd/conn-cmd/conn-workspace.sh](cmd/conn-workspace.sh) - connect to cli workspace with work user

-[cmd/conn-cmd/conn-root-workspace.sh](cmd/conn-root-workspace.sh) - connect to cli workspace with root user

-[cmd/conn-*.sh](cmd/) - connect to container with windows support


-[cmd/purge-beanstalkd.sh](cmd/purge-beanstalkd.sh) - clear beanstalkd queue

-[cmd/rebuild.sh](cmd/rebuild.sh) - rebuild new docker images(without copy _env), run xdebug mode(dev-env)


#what news
xdebug for cli (workspace docker) opt: PHP_IDE_CONFIG = serverName=laravel
windows support
cmd tools for quick work

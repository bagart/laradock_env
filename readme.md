# Simple LaraDock tools and dev environments
this project is wrapper for https://github.com/LaraDock/laradock

#Install

copy to parrent path of your projects

edit [cmd/service.lst](cmd/service.lst) edit list of docker images for run

default: workspace nginx php-fpm elasticsearch postgres redis beanstalkd

full list in docker-compose.yml

edit [_env/default/laradock/prepare.sh](_env/default/laradock/prepare.sh) for all change of default config


edit [_env/{dev,test,prod}/docker-compose.yml](_env/dev/docker-compose.yml) configure docker-compose

you can add any other files/path of your project like .env(for dev server)

run [cmd/install.sh {env}](cmd/install.sh) 
- 1st run: install
- 2nd run: reinstall (full rebuild) with clear db, if image is changed

{env}: dev (is default), test, prod

you can change it with add to current user(~/.bash_aliases) or run in console:
```
export LaraDock_ENV=test
```
#Use

[cmd/up.sh](cmd/up.sh) - run laradock containers with docker-list (in file) and connect to workspace

[cmd/stop.sh](cmd/stop.sh) - stop all laradock container
  
[cmd/conn-cmd/conn-workspace.sh](cmd/conn-workspace.sh) - connect to cli workspace with work user

[cmd/conn-cmd/conn-root-workspace.sh](cmd/conn-root-workspace.sh) - connect to cli workspace with root user

[cmd/conn-*.sh](cmd/) - connect to other container


[cmd/purge-beanstalkd.sh](cmd/purge-beanstalkd.sh) - clear beanstalkd queue

[cmd/rebuild.sh](cmd/rebuild.sh) - rebuild new docker images(without copy _env), run xdebug mode(dev-env)
[cmd/ps.sh](cmd/ps.sh) - information about containers ( docker-compose ps )

#What news

add env
add new cmd

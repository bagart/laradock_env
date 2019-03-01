# Laradock ENV 2.0
Laradock ENV is a wrapper with command tools for build AND management of [Laradock](https://github.com/laradock/laradock) 

## Use example

`./up.sh` 
- Regular laradock start
- Install if needed
- Start [http://localhost](http://localhost)
- Connect to workspace

`./stop.sh` - Stop Laradock

`./restart.sh` - Restart Laradock

`./ps.sh` - List of Laradock containers

`./logs.sh` - Logs of Laradock containers

`./install.sh`
- Install/Upgrade/Rebuild Laradock
- Configure Laradock with developer env (include xdebug) for current project
- Start Laradock
- Build backend with php composer and artisan DB (migration and seed)

`./fix.sh` - Fix most of problems with any containers
- stop, rm, pull, rebuild without cache 
- very slow
  Benchmark: .laradock/rebuild_containers.sh, run two times 
  * windows+ssd:
    - `time laradock/.laradock/rebuild_containers.sh`: 28 sec (second: 15 sec)
    - `time laradock/.laradock/rebuild_containers.sh --fix`: 9m 2sec

`./conn.sh $service` - Connect to Laradock service terminal by name
`./conn.sh workspace` - Connect to workspace terminal with laradock user
`./conn.sh workspace root` - Connect to workspace terminal with root user

`./conn/*.sh` - Templates with terminal for Laradock containers
`./conn/workspace.sh` - connect to workspace terminal with laradock user

`./app/*.sh` - Laradock command for application
`./app/install-composer.sh` - Build PHP App
`./app/purge-postgres.sh` - Purge Postgres DB
`./app/purge-beanstalkd.sh` - Purge BeanstalkD with consistent storage

`.laradock/*.sh` - Laradock Env internal utils
`.laradock/uninstall.sh` - Laradock uninstall with container purge

# Structure
Important: You can change "Laradock ENV" path with `.env` config

    .
    ├── laravel                # Project name, your project root
    │   ├── .git                    # Your project .git
    │   ├── cmd                     # Console utils
    │   │   ├── app*                 # Your app commands
    │   │   ├── dev*                 # Your developer commands
    │   │   ├── cloud*               # Your cloud env commands (We use Kubernates)
    -------------------------------------------------------------------------------------
    │   │   └── laradock            # Laradock_env root (THIS PROJECT)
    │   │       ├── .env*               # install with: cp .env_example .env
    │   │       ├── .env.example
    │   │       ├── .git                # Laeadock_env git  
    │   │       ├── .laradock           # Laradock_env internal utils
    │   │       │   ├── customize.sh        # Example with customize laradock. Not used in this package
    │   │       │   ├── env.sh              # Prepare env
    │   │       │   ├── rebuild.sh          # Renew all containers and prepare APP (migration, seeds)
    │   │       │   ├── rebuild_containers.sh # Renew all containers
    │   │       │   ├── uninstall.sh        # Uninstall Laradock and remove containers and DB state
    │   │       │   └── upgrade.sh          # Upgrade Laradock or load actual version 
    │   │       ├── app                 # Laradock command for application
    │   │       │   ├── install-*.sh        # Prepare App things
    │   │       │   ├── install-composer.sh # composer install
    │   │       │   └── purge-*.sh          # Purge DB state
    │   │       ├── conn                # Connect to containera
    │   │       │   └── *.sh                # Connection with different containers terminal
    │   │       │   └── workspace.sh        # Application workspace bash
    │   │       ├── fix.sh              # Fix most of problems with any containers
    │   │       ├── install.sh          # Prepare last laradock version
    │   │       ├── LICENSE             # MIT LICENSE
    │   │       ├── logs.sh             # Laradock Logs
    │   │       ├── ps.sh               # Laradock container list
    │   │       ├── README.md           # This document
    │   │       ├── restart.sh          # Laradock restart
    │   │       ├── stop.sh             # Laradock stop 
    │   │       └── up.sh               # Laradock run
    -------------------------------------------------------------------------------------
    │   └── public              # Public HTTP root path
    │       └── index.php           # default http script
    ├── laradock_laravel*       # Autocreated Laradock root
    └── .gitignore              # Add `laradock_laravel*` +/- `cmd/laradock` to gitignore

# INSTALL

Run in root of your project

```bash
git submodule add git://github.com/bagart/laradock_env.git cmd/laradock
cmd/laradock/up.sh
cp cmd/laradock/.env.example cmd/laradock/.env
```

### Alternative
```bash
git clone git://github.com/bagart/laradock_env.git cmd/laradock
cmd/laradock/up.sh
cp cmd/laradock/.env.example cmd/laradock/.env
```

### Optional
```bash
rm -rf cmd/laradock/.git
git add cmd/laradock/*
```

# Prepare Laravel for Laradock
laravel/.env
```env
DB_CONNECTION=pgsql
DB_HOST=postgres
DB_DATABASE=default
DB_USERNAME=default
DB_PASSWORD=secret

BROADCAST_DRIVER=redis
CACHE_DRIVER=redis
SESSION_DRIVER=redis

REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379 

#for use with workers: redis|beanstalkd|etc
QUEUE_CONNECTION=sync
```

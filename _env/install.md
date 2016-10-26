#Install

- [install docker](https://docs.docker.com/engine/installation/linux/ubuntulinux/)

        sudo su -
        apt install apt-transport-https ca-certificates linux-image-extra-$(uname -r) linux-image-extra-virtual
        apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
        echo deb https://apt.dockerproject.org/repo ubuntu-xenial main > /etc/apt/sources.list.d/docker.list
        apt update
        apt install docker
        service docker start
        exit

- [install docker-compose](#https://docs.docker.com/compose/install/)
- install env

        sudo apt install git

    optional: laravel on localhost

        sudo apt install composer php5.6 php-mbstring php-curl php-xml php-xdebug

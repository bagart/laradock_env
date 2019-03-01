#! /bin/bash
LARADOCK_CURRENT_PATH=`pwd`
if [ -f `dirname "${BASH_SOURCE[0]}"`/../.env ]; then
    . `dirname "${BASH_SOURCE[0]}"`/../.env
else
    . `dirname "${BASH_SOURCE[0]}"`/../.env.example
fi

#echo ----------------------------------------------
#echo LARADOCK_PATH         = $LARADOCK_PATH
#echo LARADOCK_PROJECT_PATH = $LARADOCK_PROJECT_PATH
#echo LARADOCKENV_PATH      = $LARADOCKENV_PATH
#echo LARADOCK_PROJECT_NAME = $LARADOCK_PROJECT_NAME
#echo LARADOCK_CURRENT_PATH = $LARADOCK_CURRENT_PATH
#echo ----------------------------------------------

case `uname -s` in
    Linux*)     DOCKERHOST_OS=Linux;;
    Darwin*)    DOCKERHOST_OS=Mac;;
    CYGWIN*)    DOCKERHOST_OS=Cygwin;;
    MINGW*)     DOCKERHOST_OS=MinGw;;
    *)          DOCKERHOST_OS="UNKNOWN:${unameOut}"
esac

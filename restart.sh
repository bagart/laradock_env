#! /bin/bash
. `dirname $0`/.laradock/init.sh

$LARADOCKENV_PATH/stop.sh
$LARADOCKENV_PATH/up.sh -

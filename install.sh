#! /bin/bash
. `dirname $0`/.laradock/init.sh
echo "---------- Laradock Install: $LARADOCKENV_PROJECT_NAME ----------"

$LARADOCKENV_PATH/.laradock/upgrade.sh
$LARADOCKENV_PATH/.laradock/dotenv_rebuild.sh
$LARADOCKENV_PATH/.laradock/customize.sh

$LARADOCKENV_PATH/.laradock/rebuild.sh --silence --stopped $1

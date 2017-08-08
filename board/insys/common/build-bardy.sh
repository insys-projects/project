#!/bin/bash

export BOARD=$2

#echo "================================================"
#echo " BUILD BARY ARGS:"
#echo " ARG0 = $0"
#echo " ARG1 = $1"
#echo " ARG2 = $2"
#echo " ARGS = $#"
#echo "================================================"

SCRIPT_PATH=`dirname $0`
PROJECT_PATH=`dirname $1`

#echo " SCRIPT_PATH = $SCRIPT_PATH"
#echo " PROJECT_PATH = $PROJECT_PATH"

echo "================================================"
echo "  Build BARDY for $BOARD "
echo "================================================"

echo "====  source arago-env.sh   ===="
source $SCRIPT_PATH/arago-env.sh $PROJECT_PATH
echo "====  Ok   ===="

echo "====  source Bardyenv.sh   ===="
source ${HOME}/bardy/BardyEnv.sh ${HOME}/bardy
echo "====  Ok   ===="

cd ${HOME}/bardy
make clean
make

echo "================================================"
echo "  Build BARDY for ${BOARD} complete"
echo "================================================"

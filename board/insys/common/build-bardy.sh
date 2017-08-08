#!/bin/bash

export BOARD=$2

echo "================================================"
echo "  Build BARDY for ${BOARD}"
echo "================================================"

cd ${HOME}/project/board/insys/common
source ./arago-env.sh

echo "====  source arago-env.sh   ===="

cd ${HOME}/bardy

echo "====  Ok   ===="

echo "====  source Bardyenv.sh   ===="

source ./BardyEnv.sh

echo "====  Ok   ===="

make clean
make

echo "================================================"
echo "  Build BARDY for ${BOARD} complete"
echo "================================================"

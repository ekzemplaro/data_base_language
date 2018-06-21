#! /bin/bash
#
#	mongo_create.sh
#					Jun/21/2018
#
# ---------------------------------------------------------------------
#
#
#
echo "*** 開始 ***"
#
mongo admin -u scott -p tiger123 < city_create.js
#
echo "*** 終了 ***"
#

#! /bin/bash
#
#	mcached_delete.sh
#
#						Feb/17/2015
#
# --------------------------------------------------------------------------
echo "*** 開始 ***"
#
SERVER=localhost
PORT=11211
#
key_in=$1
#
echo $key_in
#
memrm --servers=$SERVER:$PORT $key_in
# --------------------------------------------------------------------------
#
echo "*** 終了 ***"
# --------------------------------------------------------------------------

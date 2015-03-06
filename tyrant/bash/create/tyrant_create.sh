#! /bin/bash
#
#	tyrant_create.sh
#
#					Feb/17/2015
#
# -------------------------------------------------------------------------
echo "*** 開始 ***"
SERVER="host_ubuntu1"
PORT=1978
cd /tmp
#
echo '{"name":"那覇","population":92651,"date_mod":"2001-8-15"}' >t4761
echo '{"name":"宜野湾","population":91847,"date_mod":"2001-6-21"}' > t4762
echo '{"name":"石垣","population":52674,"date_mod":"2001-7-2"}' > t4763
echo '{"name":"浦添","population":95613,"date_mod":"2001-8-14"}' > t4764
echo '{"name":"名護","population":32167,"date_mod":"2001-9-9"}' > t4765
echo '{"name":"糸満","population":93724,"date_mod":"2001-10-17"}' > t4766
echo '{"name":"沖縄","population":81376,"date_mod":"2001-11-24"}' > t4767
echo '{"name":"豊見城","population":51428,"date_mod":"2001-12-21"}' > t4768
echo '{"name":"うるま","population":68176,"date_mod":"2001-11-17"}' > t4769
#
memflush --servers=$SERVER:$PORT
memcp --servers=$SERVER:$PORT --set t4761 t4762 t4763 t4764 t4765 t4766 t4767 t4768 t4769
#
rm -f /tmp/t47*
echo "*** 終了 ***"

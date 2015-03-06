#! /bin/bash
#
#	mcached_create.sh
#
#					Oct/06/2014
#
# -------------------------------------------------------------------------
echo "*** 開始 ***"
#
SERVER=localhost
PORT=11211
#
cd /tmp
echo '{"name":"金沢","population":76153,"date_mod":"2001-3-15"}' >t1731
echo '{"name":"輪島","population":31847,"date_mod":"2001-6-21"}' > t1732
echo '{"name":"小松","population":59671,"date_mod":"2001-7-2"}' > t1733
echo '{"name":"七尾","population":95613,"date_mod":"2001-8-14"}' > t1734
echo '{"name":"珠洲","population":32167,"date_mod":"2001-9-9"}' > t1735
echo '{"name":"加賀","population":93524,"date_mod":"2001-10-17"}' > t1736
echo '{"name":"羽咋","population":81376,"date_mod":"2001-11-24"}' > t1737
echo '{"name":"かほく","population":57428,"date_mod":"2001-12-21"}' > t1738
echo '{"name":"白山","population":68174,"date_mod":"2001-11-17"}' > t1739
#
memflush --servers=$SERVER:$PORT
memcp --servers=$SERVER:$PORT --set t1731 t1732 t1733 t1734 t1735 t1736 t1737 t1738 t1739
#
rm -f /tmp/t17*
echo "*** 終了 ***"

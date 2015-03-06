#! /bin/bash
#
#	mcachedb_create.sh
#
#					Feb/17/2015
#
# -------------------------------------------------------------------------
echo "*** 開始 ***"
SERVER="host_ubuntu1"
PORT=21201
cd /tmp
#
echo '{"name":"新潟","population":42659,"date_mod":"2001-6-15"}' > t1521
echo '{"name":"長岡","population":25471,"date_mod":"2001-9-21"}' > t1522
echo '{"name":"新発田","population":39714,"date_mod":"2001-7-2"}' > t1523
echo '{"name":"上越","population":27135,"date_mod":"2001-8-14"}' > t1524
echo '{"name":"糸魚川","population":52317,"date_mod":"2001-9-9"}' > t1525
echo '{"name":"加茂","population":71528,"date_mod":"2001-10-17"}' > t1526
echo '{"name":"三条","population":68376,"date_mod":"2001-11-24"}' > t1527
echo '{"name":"佐渡","population":26493,"date_mod":"2001-12-21"}' > t1528
echo '{"name":"柏崎","population":14275,"date_mod":"2001-11-17"}' > t1529
echo '{"name":"村上","population":31762,"date_mod":"2001-8-12"}' > t1530
echo '{"name":"十日町","population":72456,"date_mod":"2001-6-9"}' > t1531
echo '{"name":"五泉","population":85914,"date_mod":"2001-9-21"}' > t1532
#
memflush --servers=$SERVER":"$PORT
memcp --servers=$SERVER":"$PORT --set t1521 t1522 t1523 t1524 t1525 t1526 \
	 t1527 t1528 t1529 t1530 t1531 t1532
#
echo "*** 終了 ***"

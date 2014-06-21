#! /bin/bash
#
#	mcachedb_create.sh
#
#					Sep/02/2010
#
# -------------------------------------------------------------------------
echo "*** 開始 ***"
#
echo '{"name":"新潟","population":42659,"date_mod":"2001-9-15"}' > t1521
echo '{"name":"長岡","population":21471,"date_mod":"2001-9-21"}' > t1522
echo '{"name":"新発田","population":39714,"date_mod":"2001-7-2"}' > t1523
echo '{"name":"上越","population":25435,"date_mod":"2001-8-14"}' > t1524
echo '{"name":"糸魚川","population":52367,"date_mod":"2001-9-9"}' > t1525
echo '{"name":"加茂","population":71528,"date_mod":"2001-10-17"}' > t1526
echo '{"name":"三条","population":68376,"date_mod":"2001-11-24"}' > t1527
echo '{"name":"佐渡","population":28423,"date_mod":"2001-12-21"}' > t1528
echo '{"name":"柏崎","population":18175,"date_mod":"2001-11-17"}' > t1529
echo '{"name":"村上","population":38362,"date_mod":"2001-8-12"}' > t1530
echo '{"name":"十日町","population":78256,"date_mod":"2001-6-9"}' > t1531
echo '{"name":"五泉","population":85474,"date_mod":"2001-9-21"}' > t1532
#
memcflush --servers=localhost:21201
memccp --servers=localhost:21201 --set t1521 t1522 t1523 t1524 t1525 t1526 \
	 t1527 t1528 t1529 t1530 t1531 t1532
#
echo "*** 終了 ***"

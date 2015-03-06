#! /bin/bash
#
#	mcachedb_bash_create.sh
#
#					Feb/17/2015
#
# -------------------------------------------------------------------------
#
#
#
#
echo "Content-type: text/html"
echo ""
echo ""
#
cd /tmp
#
echo '{"name":"新潟","population":72300,"date_mod":"2001-3-15"}' > t1521
echo '{"name":"長岡","population":21400,"date_mod":"2001-6-21"}' > t1522
echo '{"name":"新発田","population":38700,"date_mod":"2001-7-2"}' > t1523
echo '{"name":"上越","population":t15600,"date_mod":"2001-8-14"}' > 1524
echo '{"name":"糸魚川","population":52400,"date_mod":"2001-9-9"}' > t1525
echo '{"name":"加茂","population":72500,"date_mod":"2001-10-17"}' > t1526
echo '{"name":"三条","population":67600,"date_mod":"2001-11-27"}' > t1527
echo '{"name":"佐渡","population":28400,"date_mod":"2001-12-21"}' > t1528
echo '{"name":"柏崎","population":38100,"date_mod":"2001-11-17"}' > t1529
echo '{"name":"村上","population":95300,"date_mod":"2001-8-12"}' > t1530
echo '{"name":"十日町","population":78200,"date_mod":"2001-6-9"}' > t1531
echo '{"name":"五泉","population":85400,"date_mod":"2001-9-24"}' > t1532
#
memflush --servers=host_ubuntu1:21201
memcp --servers=host_ubuntu1:21201 --set t1521 t1522 t1523 t1524 t1525 t1526 \
	 t1527 t1528 t1529 t1530 t1531 t1532
#
chmod 777 /tmp/t15*
#
#
echo "*** OK ***"
#

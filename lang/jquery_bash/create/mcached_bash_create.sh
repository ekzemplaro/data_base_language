#! /bin/bash
#
#	mcached_bash_create.sh
#
#					Oct/16/2014
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
echo '{"name":"金沢","population":92600,"date_mod":"2001-10-15"}' >t1731
echo '{"name":"輪島","population":61800,"date_mod":"2001-9-21"}' > t1732
echo '{"name":"小松","population":53700,"date_mod":"2001-7-2"}' > t1733
echo '{"name":"七尾","population":85200,"date_mod":"2001-8-14"}' > t1734
echo '{"name":"珠洲","population":27600,"date_mod":"2001-2-9"}' > t1735
echo '{"name":"加賀","population":61500,"date_mod":"2001-10-17"}' > t1736
echo '{"name":"羽咋","population":38300,"date_mod":"2001-11-23"}' > t1737
echo '{"name":"かほく","population":59400,"date_mod":"2001-12-19"}' > t1738
echo '{"name":"白山","population":47100,"date_mod":"2001-11-17"}' > t1739
#
memflush --servers=localhost:11211
memcp --servers=localhost:11211 --set t1731 t1732 t1733 t1734 t1735 t1736 t1737 t1738 t1739
#
rm /tmp/t173*
#
echo "*** OK ***"
#

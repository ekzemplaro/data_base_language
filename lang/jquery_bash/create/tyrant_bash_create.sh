#! /bin/bash
#
#	tyrant_bash_create.sh
#
#					Mar/27/2012
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
echo '{"name":"那覇","population":92600,"date_mod":"2001-8-18"}' >t4761
echo '{"name":"宜野湾","population":61800,"date_mod":"2001-9-21"}' > t4762
echo '{"name":"石垣","population":53700,"date_mod":"2001-7-2"}' > t4763
echo '{"name":"浦添","population":85200,"date_mod":"2001-8-14"}' > t4764
echo '{"name":"名護","population":27600,"date_mod":"2001-2-9"}' > t4765
echo '{"name":"糸満","population":41500,"date_mod":"2001-10-17"}' > t4766
echo '{"name":"沖縄","population":38300,"date_mod":"2001-11-23"}' > t4767
echo '{"name":"豊見城","population":58400,"date_mod":"2001-12-19"}' > t4768
echo '{"name":"うるま","population":48100,"date_mod":"2001-9-17"}' > t4769
#
memcflush --servers=localhost:1978
memccp --servers=localhost:1978 --set t4761 t4762 t4763 t4764 t4765 t4766 t4767 t4768 t4769
#
rm /tmp/t476*
#
echo "*** OK ***"
#

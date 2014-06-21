#! /bin/bash
#
#	text_bash_create.sh
#
#					Jul/17/2011
#
# ---------------------------------------------------------------------
#
echo "Content-type: text/html"
echo ""
echo ""
#
file_tcb=/var/tmp/tokyo_cabinet/cities.tcb
#
touch $file_tcb
tcbmgr put $file_tcb t0831 '{"name":"水戸","population":13500,"date_mod":"2001-8-13"}'
tcbmgr put $file_tcb t0832 '{"name":"古河","population":45100,"date_mod":"2001-10-12"}'
tcbmgr put $file_tcb t0833 '{"name":"結城","population":98200,"date_mod":"2001-3-9"}'
tcbmgr put $file_tcb t0834 '{"name":"土浦","population":98100,"date_mod":"2001-7-17"}'
tcbmgr put $file_tcb t0835 '{"name":"牛久","population":98400,"date_mod":"2001-8-24"}'
tcbmgr put $file_tcb t0836 '{"name":"取手","population":97400,"date_mod":"2001-9-25"}'
tcbmgr put $file_tcb t0837 '{"name":"つくば","population":42700,"date_mod":"2001-10-17"}'
tcbmgr put $file_tcb t0838 '{"name":"日立","population":25200,"date_mod":"2001-11-27"}'
tcbmgr put $file_tcb t0839 '{"name":"守谷","population":49500,"date_mod":"2001-7-21"}'
#
#
echo "*** OK ***"
#
# ---------------------------------------------------------------------

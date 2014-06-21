#! /bin/bash
#
#	tcbn_create.sh
#					Jun/14/2013
#
#
# ---------------------------------------------------------------------
file_tcb=$1
#
echo "*** 開始 ***"
#
touch $file_tcb
tcbmgr put $file_tcb t0831 '{"name":"水戸","population":71563,"date_mod":"2001-5-13"}'
tcbmgr put $file_tcb t0832 '{"name":"古河","population":29451,"date_mod":"2001-10-12"}'
tcbmgr put $file_tcb t0833 '{"name":"結城","population":65742,"date_mod":"2001-3-9"}'
tcbmgr put $file_tcb t0834 '{"name":"土浦","population":84521,"date_mod":"2001-7-17"}'
tcbmgr put $file_tcb t0835 '{"name":"牛久","population":23469,"date_mod":"2001-8-24"}'
tcbmgr put $file_tcb t0836 '{"name":"取手","population":17468,"date_mod":"2001-9-25"}'
tcbmgr put $file_tcb t0837 '{"name":"つくば","population":36421,"date_mod":"2001-10-17"}'
tcbmgr put $file_tcb t0838 '{"name":"日立","population":25178,"date_mod":"2001-11-27"}'
tcbmgr put $file_tcb t0839 '{"name":"守谷","population":71496,"date_mod":"2001-7-21"}'
#
echo "*** 終了 ***"
#
# ---------------------------------------------------------------------

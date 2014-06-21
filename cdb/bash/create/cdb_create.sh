#! /bin/bash
#
#	cdb_create.sh
#
#					May/29/2012
#
# -------------------------------------------------------------------------
echo "*** 開始 ***"
#
echo '{"name":"豊中","population":65398,"date_mod":"2001-7-5"}' >t2761
echo '{"name":"池田","population":91827,"date_mod":"2001-1-24"}' > t2762
echo '{"name":"高槻","population":67154,"date_mod":"2001-3-8"}' > t2763
echo '{"name":"吹田","population":95613,"date_mod":"2001-8-14"}' > t2764
echo '{"name":"茨木","population":32167,"date_mod":"2001-9-9"}' > t2765
echo '{"name":"摂津","population":93524,"date_mod":"2001-10-17"}' > t2766
echo '{"name":"泉大津","population":81376,"date_mod":"2001-11-24"}' > t2767
echo '{"name":"和泉","population":57428,"date_mod":"2001-12-15"}' > t2768
echo '{"name":"高石","population":17652,"date_mod":"2001-10-27"}' > t2769
#
#
ls -al t27* | awk '{print $5,$9}' > tmp0956
awk '{print $1-1,$2}' tmp0956 > tmp0958
awk '{print "echo -n \"+5,"$1":"$2"->\""
	print "cat",$2}' tmp0958 > go_tmp
#
bash ./go_tmp > tmp0962
echo "" >> tmp0962
#
cdbmake /var/tmp/cdb/cities.cdb /var/tmp/cdb/cities.tmp < tmp0962
#
echo "*** 終了 ***"
#

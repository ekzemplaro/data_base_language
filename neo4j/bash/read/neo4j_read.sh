#! /bin/bash
#
#	neo4j_read.sh
#
#				Aug/30/2012
#
JSHON=/home/uchida/lang/bash/jshon/jshon/jshon
TMP_AA=/tmp/tmp00591
TMP_BB=/tmp/tmp00592
#
rm -f $TMP_AA
rm -f $TMP_BB
#
for it in {1..9}
do
	curl -s http://localhost:7474/db/data/node/$it/properties -o $TMP_AA
	idx=`$JSHON -e id < $TMP_AA`
	namex=`$JSHON -e name < $TMP_AA`
	popx=`$JSHON -e population < $TMP_AA`
	datex=`$JSHON -e date_mod < $TMP_AA`
	echo $idx"	"$namex"	"$popx"	"$datex | sed 's/\"//g' >> $TMP_BB
done
#
cat $TMP_BB
#

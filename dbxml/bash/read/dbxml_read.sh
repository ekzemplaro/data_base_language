#! /bin/bash
#
#	dbxml_read.sh
#
#					Jul/09/2012
#
# ---------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
#
WORK_FILE_AA="/tmp/tmp00516"
WORK_FILE_BB="/tmp/tmp00517"
WORK_FILE_CC="/tmp/tmp00518"
echo "*** 開始 ***"
#
#
echo '<root>' > $WORK_FILE_AA
#
/usr/local/bin/dbxml << EOF >> $WORK_FILE_AA
#
openContainer cities.dbxml
query 'collection("./cities.dbxml")'
print
quit
EOF
#
echo '</root>' >> $WORK_FILE_AA
sed 's/dbxml>//g' $WORK_FILE_AA > $WORK_FILE_BB
awk '!/collection/{print $0}' $WORK_FILE_BB > $WORK_FILE_CC
$BASH_COMMON/xml_to_txt.sh < $WORK_FILE_CC
#
rm -f $WORK_FILE_AA
rm -f $WORK_FILE_BB
rm -f $WORK_FILE_CC
#
echo "*** 終了 ***"
# ---------------------------------------------------

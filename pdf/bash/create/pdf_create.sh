#! /bin/bash
#
#	pdf_create.sh
#
#					Jun/29/2012
#
# ----------------------------------------------------------
function data_prepare_proc ()
{
	file_out=$1
#
	echo "t2531	大津	95417	2001-4-11" > $file_out
	echo "t2532	草津	51674	2001-2-15" >> $file_out
	echo "t2533	守山	96932	2001-6-21" >> $file_out
	echo "t2534	栗東	34156	2001-2-14" >> $file_out
	echo "t2535	野洲	29275	2001-7-27" >> $file_out
	echo "t2536	甲賀	72316	2001-6-30" >> $file_out
	echo "t2537	湖南	27435	2001-3-24" >> $file_out
	echo "t2538	近江八幡	18692	2001-5-19" >> $file_out
	echo "t2539	彦根	52174	2001-7-21" >> $file_out
}

# ----------------------------------------------------------
FILE_PDF=$1
TMP_TXT_AA="/tmp/tmp00245.txt"
TMP_TXT_BB="/tmp/tmp00372.txt"
TMP_PS="/tmp/tmp00396.ps"
#
echo "*** 開始 ***"
#
data_prepare_proc $TMP_TXT_AA
#
nkf -e $TMP_TXT_AA > $TMP_TXT_BB
#
a2ps $TMP_TXT_BB -o $TMP_PS --encoding=euc-jp --no-header --font-size=12 -r
#
ps2pdf -dAutoRoatePages#/Auto $TMP_PS $FILE_PDF
#
echo "*** 終了 ***"
# ----------------------------------------------------------

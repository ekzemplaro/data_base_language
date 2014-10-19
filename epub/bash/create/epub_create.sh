#! /bin/bash
#
#	epub_create.sh
#					Sep/17/2014
#

# ----------------------------------------------------------
function data_prepare_proc ()
{
	file_out=$1
#
echo "t1931	甲府	42731	2001-5-12" > $file_tmp
echo "t1932	富士吉田	58678	2001-7-15" >> $file_tmp
echo "t1933	都留	21934	2001-6-21" >> $file_tmp
echo "t1934	山梨	74152	2001-2-14" >> $file_tmp
echo "t1935	大月	89275	2001-7-27" >> $file_tmp
echo "t1936	韮崎	72316	2001-6-30" >> $file_tmp
echo "t1937	南アルプス	27585	2001-3-24" >> $file_tmp
echo "t1938	北杜	18672	2001-5-19" >> $file_tmp
echo "t1939	甲斐	34197	2001-7-21" >> $file_tmp
}
# ----------------------------------------------------------
file_epub=$1
file_tmp="/tmp/tmp002345.txt"
#
echo "*** 開始 ***"
#
data_prepare_proc $file_tmp
#
ebook-convert $file_tmp $file_epub --no-default-epub-cover
#
chmod 666 $file_epub
rm -f $file_tmp
echo "*** 終了 ***"
# ----------------------------------------------------------

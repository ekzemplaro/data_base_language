#! /bin/bash
#
#	text_create.sh
#					May/20/2013
#
# ----------------------------------------------------------
function data_prepare_proc ()
{
	file_out=$1
#
	echo "t2381	名古屋	95417	2001-9-11" > $file_out
	echo "t2382	豊橋	51674	2001-1-15" >> $file_out
	echo "t2383	岡崎	96132	2001-7-21" >> $file_out
	echo "t2384	一宮	34156	2001-2-14" >> $file_out
	echo "t2385	蒲郡	29875	2001-10-27" >> $file_out
	echo "t2386	常滑	72316	2001-6-30" >> $file_out
	echo "t2387	大府	27435	2001-3-21" >> $file_out
	echo "t2388	瀬戸	18692	2001-5-19" >> $file_out
	echo "t2389	犬山	52174	2001-7-24" >> $file_out
}

echo "*** 開始 ***"
data_prepare_proc $1
#
echo "*** 終了 ***"
# ----------------------------------------------------------

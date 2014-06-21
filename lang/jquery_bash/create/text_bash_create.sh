#! /bin/bash
#
#	text_bash_create.sh
#
#					Sep/02/2013
#
# ----------------------------------------------------------------
#
file_out="/var/tmp/plain_text/cities.txt"
#
#
echo "Content-type: text/html"
echo ""
echo ""
#
echo "2381	名古屋	52700	2001-10-21" > $file_out
echo "2382	豊橋	58600	2001-2-15" >> $file_out
echo "2383	岡崎	93200	2001-6-21" >> $file_out
echo "2384	一宮	34000	2001-2-14" >> $file_out
echo "2385	蒲郡	21700	2001-7-27" >> $file_out
echo "2386	常滑	75900	2001-6-30" >> $file_out
echo "2387	大府	34800	2001-3-24" >> $file_out
echo "2388	瀬戸	19600	2001-5-19" >> $file_out
echo "2389	犬山	52100	2001-7-15" >> $file_out
#
#
echo "*** OK ***"
#
# ----------------------------------------------------------------

#! /bin/bash
#
#	notyet_bash_read.sh
#
#					Feb/08/2011
#
#
# ---------------------------------------------------------------------
echo "Content-type: text/json"
echo
echo
#
echo 
json_str='{"cities":[{"id":"921","name":"横浜","population":"90347","date_mod":"2001-3-12"},'
#
json_str=$json_str'{"id":"922","name":"川崎","population":"15348","date_mod":"2001-1-15"},'
#
json_str=$json_str'{"id":"923","name":"小田原","population":"16342","date_mod":"2001-6-17"},'
#
json_str=$json_str'{"id":"924","name":"藤沢","population":"90346","date_mod":"2001-5-19"},'
json_str=$json_str'{"id":"925","name":"相模原","population":"70341","date_mod":"2001-2-22"},'
json_str=$json_str'{"id":"926","name":"厚木","population":"24341","date_mod":"2001-5-17"},'
json_str=$json_str'{"id":"927","name":"横須賀","population":"35341","date_mod":"2001-8-14"},'
json_str=$json_str'{"id":"928","name":"鎌倉","population":"82347","date_mod":"2001-9-21"},'
json_str=$json_str'{"id":"929","name":"逗子","population":"12347","date_mod":"2001-10-14"}]}'
#
echo $json_str
#
#
#
# ---------------------------------------------------------------------
#

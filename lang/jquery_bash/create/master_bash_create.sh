#! /bin/bash
#
#	master_bash_read.sh
#
#
#
# ---------------------------------------------------------------------
echo "Content-type: text/json"
echo
echo
#
echo 
json_str='{"cities":[{"id":"921","name":"	横浜","population":"90345","date_mod":"2001-03-02"},'
#
json_str=$json_str'{"id":"922","name":"川崎","population":"15345","date_mod":"2001-01-05"},'
#
json_str=$json_str'{"id":"923","name":"小田原","population":"16345","date_mod":"2001-01-17"},'
#
json_str=$json_str'{"id":"924","name":"藤沢","population":"90345","date_mod":"2001-02-09"},'
json_str=$json_str'{"id":"925","name":"相模原","population":"90345","date_mod":"2001-02-22"},'
json_str=$json_str'{"id":"926","name":"厚木","population":"1009345","date_mod":"2001-02-14"}]}'
#
echo $json_str
#
#
#
# ---------------------------------------------------------------------
#

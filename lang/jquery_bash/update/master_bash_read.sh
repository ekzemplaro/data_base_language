#! /bin/bash
#
#	master_bash_read.sh
#
#					Jun/07/2011
#
#
# ---------------------------------------------------------------------
echo "Content-type: text/json"
echo
echo
#
echo 
json_str='{"t0421": {"name":"仙台","population":"61389","date_mod":"2001-3-12"},'
#
json_str=$json_str'"t0422": {"name":"石巻","population":"12348","date_mod":"2001-1-15"},'
#
json_str=$json_str'"t0423": {"name":"塩竈","population":"46342","date_mod":"2001-6-17"},'
#
json_str=$json_str'"t0424": {"name":"気仙沼","population":"98341","date_mod":"2001-5-19"},'
json_str=$json_str'"t0425": {"name":"白石","population":"75346","date_mod":"2001-2-22"},'
json_str=$json_str'"t0426": {"name":"名取","population":"24328","date_mod":"2001-5-17"},'
json_str=$json_str'"t0427": {"name":"多賀城","population":"35375","date_mod":"2001-8-14"},'
json_str=$json_str'"t0428": {"name":"岩沼","population":"82347","date_mod":"2001-9-21"},'
json_str=$json_str'"t0429": {"name":"大崎","population":"12943","date_mod":"2001-10-14"}}'
#
echo $json_str
#
#
#
# ---------------------------------------------------------------------
#

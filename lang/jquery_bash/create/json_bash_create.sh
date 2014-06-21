#! /bin/bash
#
#	json_bash_create.sh
#
#					Jun/02/2014
#
#
# ---------------------------------------------------------------
function out_record
{
	echo ' "'$id'":'  >> $file_json
	echo ' {"name": "'$name'",'  >> $file_json
	echo ' "population": '$population','  >> $file_json
	echo ' "date_mod": "'$date_mod'"}'  >> $file_json
}
#
# ---------------------------------------------------------------
function json_prepare
{
echo '{' > $file_json
#
id='t0921'
name='宇都宮'
population=71200
date_mod='2001-6-18'
out_record
echo ',' >> $file_json
#
id='t0922'
name='小山'
population=63800
date_mod='2001-4-18'
out_record
echo ',' >> $file_json
#
id='t0923'
name='佐野'
population=98100
date_mod='2001-5-21'
out_record
echo ',' >> $file_json
#
id='t0924'
name='足利'
population=72900
date_mod='2001-6-23'
out_record
echo ',' >> $file_json
#
id='t0925'
name='日光'
population=16500
date_mod='2001-9-21'
out_record
echo ',' >> $file_json
#
id='t0926'
name='下野'
population=35700
date_mod='2001-8-14'
out_record
echo ',' >> $file_json
#
id='t0927'
name='さくら'
population=94500
date_mod='2001-7-9'
out_record
echo ',' >> $file_json
#
id='t0928'
name='矢板'
population=83700
date_mod='2001-10-14'
out_record
echo ',' >> $file_json
#
id='t0929'
name='真岡'
population=48500
date_mod='2001-9-9'
out_record
echo ',' >> $file_json
#
id='t0930'
name='栃木'
population=74100
date_mod='2001-11-23'
out_record
echo ',' >> $file_json
#
id='t0931'
name='大田原'
population=52600
date_mod='2001-9-22'
out_record
echo ',' >> $file_json
#
id='t0932'
name='鹿沼'
population=76900
date_mod='2001-8-25'
out_record
echo ',' >> $file_json
#
id='t0933'
name='那須塩原'
population=38400
date_mod='2001-9-27'
out_record
echo ',' >> $file_json
#
id='t0934'
name='那須烏山'
population=79500
date_mod='2001-8-23'
out_record
#
echo '}' >> $file_json
}
#
# ---------------------------------------------------------------
echo "Content-type: text/html"
echo ""
echo ""
#
file_json="/var/tmp/json/cities.json"
json_prepare
#
echo "*** OK ***"
#
# ---------------------------------------------------------------

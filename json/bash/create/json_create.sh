#! /bin/bash
#
#	json_create.sh
#
#					Aug/29/2013
#
# ---------------------------------------------------------------
file_json=$1
#
#
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
population=84516
date_mod='2001-3-16'
out_record
echo ',' >> $file_json
#
id='t0922'
name='小山'
population=91237
date_mod='2001-4-21'
out_record
echo ',' >> $file_json
#
id='t0923'
name='佐野'
population=63489
date_mod='2001-5-21'
out_record
echo ',' >> $file_json
#
id='t0924'
name='足利'
population=72561
date_mod='2001-6-23'
out_record
echo ',' >> $file_json
#
id='t0925'
name='日光'
population=61743
date_mod='2001-9-21'
out_record
echo ',' >> $file_json
#
id='t0926'
name='下野'
population=52398
date_mod='2001-8-14'
out_record
echo ',' >> $file_json
#
id='t0927'
name='さくら'
population=45146
date_mod='2001-7-05'
out_record
echo ',' >> $file_json
#
id='t0928'
name='矢板'
population=37617
date_mod='2001-10-14'
out_record
echo ',' >> $file_json
#
id='t0929'
name='真岡'
population=52698
date_mod='2001-9-19'
out_record
echo ',' >> $file_json
#
id='t0930'
name='栃木'
population=47912
date_mod='2001-11-23'
out_record
echo ',' >> $file_json
#
id='t0931'
name='大田原'
population=52317
date_mod='2001-9-22'
out_record
echo ',' >> $file_json
#
id='t0932'
name='鹿沼'
population=62158
date_mod='2001-8-25'
out_record
echo ',' >> $file_json
#
id='t0933'
name='那須塩原'
population=82719
date_mod='2001-6-27'
out_record
echo ',' >> $file_json
#
id='t0934'
name='那須烏山'
population=92157
date_mod='2001-5-14'
out_record
#
echo '}' >> $file_json
}

# ---------------------------------------------------------------
echo "*** 開始 ***"
json_prepare
echo "*** 終了 ***"

#
# ---------------------------------------------------------------

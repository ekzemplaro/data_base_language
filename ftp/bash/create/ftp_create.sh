#! /bin/bash
#
#	ftp_create.sh
#
#						Sep/23/2013
#
# ---------------------------------------------------------------
HOST="host_dbase"
file_json='/tmp/iwate.json'
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
id='t0361'
name='盛岡'
population=75249
date_mod='2001-3-15'
out_record
echo ',' >> $file_json
#
id='t0362'
name='久慈'
population=36158
date_mod='2001-7-21'
out_record
echo ',' >> $file_json
#
id='t0363'
name='二戸'
population=58672
date_mod='2001-5-24'
out_record
echo ',' >> $file_json
#
id='t0364'
name='宮古'
population=79534
date_mod='2001-6-13'
out_record
echo ',' >> $file_json
#
id='t0365'
name='遠野'
population=62741
date_mod='2001-2-12'
out_record
echo ',' >> $file_json
#
id='t0366'
name='八幡平'
population=53718
date_mod='2001-8-14'
out_record
echo ',' >> $file_json
#
id='t0367'
name='大船渡'
population=41689
date_mod='2001-7-5'
out_record
echo ',' >> $file_json
#
id='t0368'
name='一関'
population=35614
date_mod='2001-10-14'
out_record
echo ',' >> $file_json
#
id='t0369'
name='花巻'
population=81726
date_mod='2001-9-9'
out_record
#
echo '}' >> $file_json
}

# ---------------------------------------------------------------
echo "*** 開始 ***"
url="ftp://scott:tiger@host_dbase/city/iwate.json"
#
json_prepare
#
curl --noproxy $HOST -T $file_json $url
#
rm -f $file_json
#
echo "*** 終了 ***"

# ---------------------------------------------------------------
#

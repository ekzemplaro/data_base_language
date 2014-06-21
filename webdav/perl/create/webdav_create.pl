#! /usr/bin/perl
#
#	webdav_create.pl
#
#					Jan/24/2012
# -------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	JSON;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use uri_get;
#
# -------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));
#
#
my $uri = 'http://host_dbase:3004/city/tokyo.json';
#
my %dict_data = data_prepare_proc ();
#
my $json_str = encode_json (\%dict_data);
#
uri_get::uri_put_proc ($uri,$json_str);
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# -------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;

	%dict_aa = text_manipulate::dict_append_proc
		('t1351','八王子',84259,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1352','立川',14278,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1353','武蔵野',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1354','三鷹',46432,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1355','青梅',27349,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1356','府中',36148,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1357','昭島',35792,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1358','調布',85146,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1359','町田',64827,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# -------------------------------------------------------

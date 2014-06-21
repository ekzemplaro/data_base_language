#! /usr/bin/perl
#
#	exist_create.pl
#
#					May/25/2012
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use xml_manipulate;
use uri_get;
#
# ----------------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));
#
#
my $url = 'http://localhost:8086/exist/rest/db/cities/cities.xml';
#
my %dict_aa = data_prepare_proc ();
#
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
#
#print $xml_str;
#
uri_get::uri_put_proc ($url,encode ('utf8',$xml_str));
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t4251','長崎',75842,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4252','佐世保',14278,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4253','島原',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4254','大村',46432,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4255','諫早',27149,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4256','五島',92184,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4257','平戸',35197,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4258','雲仙',85156,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4259','松浦',64827,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------

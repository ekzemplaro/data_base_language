#! /usr/bin/perl
#
#	xindice_create.pl
#
#					May/20/2011
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;

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
my $url = 'http://cdbd026:8888/xindice/db/cities/cities';
#
my %dict_aa = data_prepare_proc ();
#
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
#
#print $xml_str;
#
uri_get::uri_put_proc ($url,encode ('utf8',$xml_str));
#
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t0271','青森',75842,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0272','弘前',14278,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0273','八戸',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0274','三沢',46432,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0275','黒石',27149,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0276','むつ',92157,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0277','五所川原',35147,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0278','十和田',85136,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0279','平川',61829,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------

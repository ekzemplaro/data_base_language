#! /usr/bin/perl
#
#	basex_create.pl
#
#					Oct/27/2011
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
my $url = 'http://admin:admin@localhost:8984/rest/cities';
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
		('t4161','佐賀',75842,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4162','唐津',14278,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4163','鳥栖',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4164','多久',46432,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4165','伊万里',27149,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4166','武雄',92157,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4167','鹿島',35147,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4168','小城',85136,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4169','嬉野',61829,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------

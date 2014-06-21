#! /usr/bin/perl
#
#	xml_create.pl
#
#					May/20/2011
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use Encode;
use XML::Simple;
#
use lib '/var/www/data_base/common/perl_common';
use file_io;
use text_manipulate;
use xml_manipulate;
#
# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
my $file_text= $ARGV[0];
#
my %dict_aa = data_prepare_proc ();
#
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
#
file_io::string_write_proc ($file_text,encode ('utf-8',$xml_str));
#print $xml_str;
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t2261','静岡',51842,'2005-2-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2262','浜松',34279,'2005-8-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2263','沼津',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2264','三島',46432,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2265','富士',27149,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2266','熱海',92144,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2267','富士宮',35147,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2268','藤枝',85146,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2269','御殿場',64827,'2005-5-21',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2270','島田',82375,'2005-9-14',%dict_aa);

	return	%dict_aa;
}
# ----------------------------------------------------------------

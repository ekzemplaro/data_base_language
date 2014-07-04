#! /usr/bin/perl
#
#	couch_create.pl
#
#					Jun/23/2014
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
use file_io;
#
# -------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));
#
#
my $url_collection = 'http://localhost:5984/nagano';
uri_get::uri_delete_proc ($url_collection);
uri_get::uri_put_proc ($url_collection,'{}');
#
my %dict_aa = data_prepare_proc ();
#
foreach my $key (sort keys %dict_aa){
	print $key . "\t";
	my $str_json = encode_json ($dict_aa{$key});
	print $str_json . "\n";
	my $url_target = $url_collection . "/" . $key;
	uri_get::uri_put_proc ($url_target,$str_json);
	}
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# -------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;

	%dict_aa = text_manipulate::dict_append_proc
		('t2021','長野',75842,'2005-6-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2022','松本',14278,'2005-9-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2023','上田',58641,'2005-3-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2024','小諸',46732,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2025','岡谷',28149,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2026','塩尻',27638,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2027','茅野',35267,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2028','飯田',81756,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2029','中野',64327,'2005-5-21',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2030','諏訪',52917,'2005-8-14',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2031','駒ヶ根',23189,'2005-7-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2032','佐久',72945,'2005-5-16',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2033','伊那',21957,'2005-4-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2034','千曲',35871,'2005-3-21',%dict_aa);

	return	%dict_aa;
}

# -------------------------------------------------------

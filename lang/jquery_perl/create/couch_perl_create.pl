#! /usr/bin/perl
#
#	couch_perl_create.pl
#
#						Jul/23/2014
#
# -------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use LWP::UserAgent;
use	Encode;
use	JSON;
#
#
use lib '/var/www/data_base/common/perl_common';
use uri_get;
use text_manipulate;
#
# -------------------------------------------------------------
print "Content-type: text/json\n\n";
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
#
print "*** OK ***\n";
#
# -------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;

	%dict_aa = text_manipulate::dict_append_proc
		('t2021','長野',75800,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2022','松本',14200,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2023','上田',58600,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2024','小諸',76400,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2025','岡谷',27100,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2026','塩尻',98500,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2027','茅野',35100,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2028','飯田',82600,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2029','中野',64700,'2005-5-21',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2030','諏訪',52300,'2005-8-14',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2031','駒ヶ根',21600,'2005-7-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2032','佐久',72500,'2005-5-16',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2033','伊那',29700,'2005-4-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2034','千曲',32800,'2005-3-21',%dict_aa);

	return	%dict_aa;
}

# -------------------------------------------------------------

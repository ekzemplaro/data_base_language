#! /usr/bin/perl
#
#	ftp_create.pl
#
#					Sep/12/2011
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
my $uri = 'ftp://scott:tiger@host_dbase/city/iwate.json';
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
		('t0361','盛岡',75842,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0362','久慈',14278,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0363','二戸',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0364','宮古',46432,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0365','遠野',27349,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0366','八幡平',36148,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0367','大船渡',35792,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0368','一関',85146,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0369','花巻',64827,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# -------------------------------------------------------

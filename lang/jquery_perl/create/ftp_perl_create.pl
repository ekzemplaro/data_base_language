#! /usr/bin/perl
#
#	ftp_perl_create.pl
#
#						Feb/25/2013
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
use text_manipulate;
use uri_get;
#
# -------------------------------------------------------------
my $uri = 'ftp://scott:tiger@host_dbase/city/iwate.json';
#
print "Content-type: text/html\n\n";
print "*** ftp_perl_create.pl *** start ***<p />";
#
my %dict_aa = data_prepare_proc ();
#
my $json_str = encode_json (\%dict_aa);
#
#
uri_get::uri_put_proc ($uri,$json_str);
#
#
print "*** OK ***<br>";
#
# -------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;

	%dict_aa = text_manipulate::dict_append_proc
		('t0361','盛岡',71800,'2005-2-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0362','久慈',16200,'2005-8-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0363','二戸',59600,'2005-7-7',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0364','宮古',42700,'2005-4-25',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0365','遠野',27300,'2005-6-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0366','八幡平',84100,'2005-5-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0367','大船渡',35900,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0368','一関',82600,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0369','花巻',84100,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# -------------------------------------------------------------

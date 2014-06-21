#! /usr/bin/perl
#
#	ftp_delete.pl
#
#					Jan/24/2012
# -------------------------------------------------------
use	strict;
use	warnings;
use	Encode;
use	JSON;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use ftp_manipulate;
use uri_get;
#
# -------------------------------------------------------
print "*** 開始 ***\n";
#
my $key_in = $ARGV[0];
print ("$key_in\n");
#
my $uri = 'ftp://scott:tiger@host_dbase/city/iwate.json';
#
#my $str_json = uri_get::uri_get_proc ($uri);
my $str_json = ftp_manipulate::ftp_read_proc ('host_dbase','scott','tiger','city/iwate.json');
#
#print ($str_json);
#
my %dict_aa = %{decode_json ($str_json)};
#
if (exists $dict_aa{$key_in})
	{
	%dict_aa=text_manipulate::dict_delete_proc ($key_in,%dict_aa);
	text_manipulate::dict_display_proc (%dict_aa);
	my $json_str_new = encode_json (\%dict_aa);
	uri_get::uri_put_proc ($uri,$json_str_new);
	}
#
print "*** 終了 ***\n";
#
# -------------------------------------------------------

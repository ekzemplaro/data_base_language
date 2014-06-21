#! /usr/bin/perl
#
#	webdav_delete.pl
#
#					Jan/24/2012
# -------------------------------------------------------
use	strict;
use	warnings;
use	Encode;
use	JSON;
#
use lib '/var/www/data_base/common/perl_common';
use file_io;
use text_manipulate;
use uri_get;
#
# -------------------------------------------------------
print "*** 開始 ***\n";
#
my $key_in = $ARGV[0];
print ("$key_in\n");
#
my $uri = 'http://host_dbase:3004/city/tokyo.json';
#
my $str_json = uri_get::uri_get_proc ($uri);
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

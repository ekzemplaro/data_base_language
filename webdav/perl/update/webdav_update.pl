#! /usr/bin/perl
#
#	webdav_update.pl
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
my $id_in = $ARGV[0];
my $population_in = $ARGV[1];
print ("$id_in\t$population_in\n");
#
my $uri = 'http://host_dbase:3004/city/tokyo.json';
#
my $str_json = uri_get::uri_get_proc ($uri);
#
my %dict_aa = %{decode_json ($str_json)};
#
text_manipulate::dict_update_proc ($id_in,$population_in,%dict_aa);
#
text_manipulate::dict_display_proc (%dict_aa);
#
my $json_str_new = encode_json (\%dict_aa);
#
uri_get::uri_put_proc ($uri,$json_str_new);
#
print "*** 終了 ***\n";
#
# -------------------------------------------------------

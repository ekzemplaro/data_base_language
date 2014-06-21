#! /usr/bin/perl
#
#	riak_update.pl
#
#					Mar/18/2013
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
my $population_in = $ARGV[1];
print ("$key_in\t$population_in\n");
#
my $url_target = 'http://localhost:8098/riak/shimane/' . $key_in;
#
my $str_json = uri_get::uri_get_proc ($url_target);
#
my %city = %{decode_json ($str_json)};
#
print $city{"name"} . "\t";
print $city{"population"} . "\t";
print $city{"date_mod"} . "\n";
#
my $date_mod = text_manipulate::get_date_mod_proc ();
#
$city{"population"} = $population_in;
$city{"date_mod"} = $date_mod;
my $json_str_new = encode_json (\%city);
#
print $json_str_new . "\n";
print $url_target . "\n";
#
uri_get::uri_put_proc ($url_target,$json_str_new);
#
print "*** 終了 ***\n";
#
# -------------------------------------------------------

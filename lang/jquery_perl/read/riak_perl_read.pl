#! /usr/bin/perl
#
#	riak_perl_read.pl
#
#						Apr/12/2013
#
# -------------------------------------------------------------
use	strict;
use	warnings;
#
use JSON;
use Encode;
#
use LWP::UserAgent;
#
#
use lib '/var/www/data_base/common/perl_common';
use uri_get;
#
my $url_base = 'http://localhost:8098/riak/shimane';
my $url_in = $url_base . '?keys=true';
#
my $str_json = uri_get::uri_get_proc ($url_in);
#
my %data_aa = %{decode_json ($str_json)};
#
my %dict_aa;
my @keys = @{$data_aa{"keys"}};
foreach my $tkey (@keys){
	my $url_city = $url_base . '/' . $tkey ;
	my $str_json_city = uri_get::uri_get_proc ($url_city);
#	print $str_json_city . "\n";
	my %data_city = %{decode_json ($str_json_city)};
	$dict_aa{$tkey} = \%data_city;	
}
#
$str_json = encode_json (\%dict_aa);
#
print "Content-type: text/json\n\n";
#
print $str_json;
#
# -------------------------------------------------------------

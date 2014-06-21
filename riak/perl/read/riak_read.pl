#! /usr/bin/perl
#
#	read/riak_read.pl
#
#					Mar/14/2013
# -------------------------------------------------------
use	strict;
use	JSON;
use	warnings;
use	utf8;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use uri_get;
#
#
# -------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $url_base = 'http://localhost:8098/riak/shimane';
my $url_in = $url_base . '?keys=true';
#
my $str_json = uri_get::uri_get_proc ($url_in);
#
my %data_aa = %{decode_json ($str_json)};
#
my @keys = @{$data_aa{"keys"}};
my $num = $#keys;
print "num = " . $num . "\n";
#
foreach my $tkey (@keys){
	my $url_city = $url_base . '/' . $tkey ;
	my $str_json_city = uri_get::uri_get_proc ($url_city);
#	print $str_json_city . "\n";
	my %data_city = %{decode_json ($str_json_city)};
	my $out_str = $tkey . "\t";
	$out_str .=  $data_city{"name"} . "\t";
	$out_str .=  $data_city{"population"} . "\t";
	$out_str .=  $data_city{"date_mod"} . "\n";
	print (encode ('utf-8',$out_str));
	}
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# -------------------------------------------------------

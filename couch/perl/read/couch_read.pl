#! /usr/bin/perl
#
#	read/couch_read.pl
#
#					Jun/23/2014
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
my $url = 'http://localhost:5984/nagano';
#
my $str_json = uri_get::uri_get_proc ($url . "/" . "_all_docs");
#
my %hash_aa = %{decode_json ($str_json)};
#
for (my $it = 0; $it < $hash_aa{"total_rows"}; $it++){
	my $key = $hash_aa{"rows"}[$it]{"key"};
#
	my $str_json = uri_get::uri_get_proc ($url . "/" . $key);
#
	my $data=decode_json ($str_json);
	my $name = $data->{name};
	my $population = $data->{population};
	my $date_mod = $data->{date_mod};
#
	print $key . "\t";
	print encode ('utf-8',$name) . "\t";
	print $population . "\t";
	print $date_mod . "\n";
	}
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# -------------------------------------------------------

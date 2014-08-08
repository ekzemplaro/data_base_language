#! /usr/bin/perl
#
#	read/couch_read.pl
#
#					Jul/23/2014
# -------------------------------------------------------
use	strict;
use	JSON;
use	warnings;
use	utf8;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use uri_get;
use kvalue_manipulate;
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
for (my $it = 0; $it < $hash_aa{"total_rows"}; $it++)
	{
	my $key = $hash_aa{"rows"}[$it]{"key"};
#
	my $str_json = uri_get::uri_get_proc ($url . "/" . $key);
#
	kvalue_manipulate::json_display_proc ($key,$str_json);
	}
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# -------------------------------------------------------

#! /usr/bin/perl
#
#	read/neo4j_read.pl
#
#					Aug/30/2012
# -------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	JSON;
#
use lib '/var/www/data_base/common/perl_common';
use json_out;
use uri_get;
#
# -------------------------------------------------------
sub row_parser
{
	my $key = $_[0];

	my $uri = 'http://localhost:7474/db/data/node/' . $key . '/properties';
#
	my $str_json = uri_get::uri_get_proc ($uri);
#
#	print ($str_json);
#
	my $data= decode_json ($str_json);
#
#	if (exists $data{'id'})
		{
	my $out_str = $data->{id} . "\t" . $data->{'name'} . "\t";
	$out_str .= $data->{population} . "\t" . $data->{'date_mod'} . "\n";

	print (encode ('utf-8',$out_str));
		}
}

# -------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
for (my $key = 1; $key < 10; $key++)
	{
	row_parser ($key);
	}

#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# -------------------------------------------------------

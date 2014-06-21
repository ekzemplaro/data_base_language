#! /usr/bin/perl
#
#	cdb_perl_read.pl
#
#					Mar/25/2013
#
# --------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;

use	JSON;
use	CDB_File;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use kvalue_manipulate;
# --------------------------------------------------------------
#
my $file_cdb="/var/tmp/cdb/cities.cdb";
#
print "Content-type: text/json\n\n";
#
tie my %db, 'CDB_File', $file_cdb or die "$0: can't tie to $file_cdb $!\n";

my @keys = ('t2761','t2762','t2763',
	't2764','t2765','t2766',
	't2767','t2768','t2769');
#
#
my %dict_aa;
while ((my $key, my $value) = each %db)
	{
	my $str_json = $value;
	my $data = decode_json ($str_json);
	my $name=$data->{name};
	my $population=$data->{population};
	my $date_mod=$data->{date_mod};

	%dict_aa = text_manipulate::dict_append_proc
		($key,$name,$population,$date_mod,%dict_aa);

}
#
#dbmclose (%db);
#
my $out_str = encode_json (\%dict_aa);
#
#
print	$out_str;
#


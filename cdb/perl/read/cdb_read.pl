#! /usr/bin/perl    
#
#	cdb_read.pl
#
#					Aug/03/2012
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	CDB_File;
#
use lib '/var/www/data_base/common/perl_common';
#
use kvalue_manipulate;
# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));

my $file_cdb = $ARGV[0];

tie my %data, 'CDB_File', $file_cdb or die "$0: can't tie to $file_cdb: $!\n";

while ((my $key, my $value) = each %data)
	{
	kvalue_manipulate::json_display_proc ($key,$value);
    	}

print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------

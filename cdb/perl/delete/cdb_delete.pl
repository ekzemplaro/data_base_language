#! /usr/bin/perl    
#
#	cdb_delete.pl
#
#					Mar/25/2013
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	CDB_File;
use	JSON;
#
use lib '/var/www/data_base/common/perl_common';
#
use text_manipulate;
use kvalue_manipulate;
# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));

my $file_cdb = $ARGV[0];
my $key_in = $ARGV[1];
#
print	$key_in . "\n";

tie my %db, 'CDB_File', $file_cdb or die "$0: can't tie to $file_cdb $!\n";

my %dict_bb;

while ((my $key, my $value) = each %db)
	{
	$dict_bb{$key} = $value;
    	}

if (defined $db{$key_in})
	{
	delete $dict_bb{$key_in};
	}

my $new = new CDB_File($file_cdb, "$file_cdb.$$") or
            die "$0: new CDB_File failed: $!\n";

while ((my $key, my $value) = each %dict_bb)
	{
	$dict_bb{$key} = $value;
	kvalue_manipulate::json_display_proc ($key,$value);
	$new->insert($key,$value);
    	}

$new->finish;
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------

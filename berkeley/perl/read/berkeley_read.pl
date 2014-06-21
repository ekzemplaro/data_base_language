#! /usr/bin/perl
#
#	read/berkeley_read.pl
#
#					Oct/10/2011
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	DB_File;
#
use lib '/var/www/data_base/common/perl_common';
use kvalue_manipulate;
# ----------------------------------------------------------------
#
print (encode ('utf-8',"*** 開始 ***\n"));
#
my $db_file= $ARGV[0];
dbmopen(my %dd,$db_file,0644);
#
kvalue_manipulate::kvalue_display_proc (%dd);
#
dbmclose (%dd);
#
print (encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------------

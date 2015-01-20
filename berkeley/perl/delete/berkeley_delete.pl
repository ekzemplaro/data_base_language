#! /usr/bin/perl
#
#	berkeley_delete.pl
#
#					Jan/06/2015
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	DB_File;
#
# ----------------------------------------------------------------
print "*** 開始 ***\n";
#
my $db_file= $ARGV[0];
my $key_in = $ARGV[1];
#
print ("$key_in\n");
#
dbmopen(my %dd,$db_file,0644);
#
delete ($dd{$key_in});
#
dbmclose (%dd);
#
print	"*** 終了 ***\n";
# ----------------------------------------------------------------

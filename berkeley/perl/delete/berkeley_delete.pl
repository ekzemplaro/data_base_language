#! /usr/bin/perl
#
#	berkeley_delete.pl
#
#					Oct/10/2011
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	DB_File;
#
use lib '/var/www/data_base/common/perl_common';
use kvalue_manipulate;
# ----------------------------------------------------------------
print "*** 開始 ***\n";
#
my $db_file= $ARGV[0];
my $id_in = $ARGV[1];
#
print ("$id_in\n");
#
dbmopen(my %dd,$db_file,0644);
#
delete ($dd{$id_in});
#
kvalue_manipulate::kvalue_display_proc (%dd);
#
dbmclose (%dd);
#
print	"*** 終了 ***\n";
# ----------------------------------------------------------------

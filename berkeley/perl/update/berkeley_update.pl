#! /usr/bin/perl
#
#	update/berkeley_update.pl
#
#					Sep/16/2010
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	DB_File;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use kvalue_manipulate;
# ----------------------------------------------------------------
print "*** 開始 ***\n";
#
my $db_file= $ARGV[0];
my $id_in = $ARGV[1];
my $population_in = $ARGV[2];
#
print ("$id_in\t$population_in\n");
#
#
dbmopen(my %dd,$db_file,0644);
#
%dd=kvalue_manipulate::kvalue_update_proc ($id_in,$population_in,%dd);
#
kvalue_manipulate::kvalue_display_proc (%dd);
#
dbmclose (%dd);
#
#
print	"*** 終了 ***\n";
# ----------------------------------------------------------------

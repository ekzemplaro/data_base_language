#! /usr/bin/perl
#
#	gdbm_update.pl
#
#					Sep/14/2010
#
# ------------------------------------------------------------
use	strict;
use	warnings;

use lib '/var/www/data_base/common/perl_common';
use kvalue_manipulate;
use text_manipulate;
#
#
# ------------------------------------------------------------
my $db_file="/var/tmp/gdbm/cities";
#
print	"*** 開始 ***\n";
my $id_in = $ARGV[0];
my $population_in = $ARGV[1];
print ("$id_in\t$population_in\n");
#
dbmopen (my %dd,$db_file,0644) || die "cannot open DBM";
#
%dd=kvalue_manipulate::kvalue_update_proc ($id_in,$population_in,%dd);
#
kvalue_manipulate::kvalue_display_proc (%dd);
#
#
dbmclose (%dd);
#
print	"*** 終了 ***\n";
#
# ------------------------------------------------------------

#! /usr/bin/perl
#
#	gdbm_delete.pl
#
#					Sep/16/2010
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
print ("$id_in\n");
#
dbmopen (my %dd,$db_file,0644) || die "cannot open DBM";
#
delete ($dd{$id_in});
#
#
kvalue_manipulate::kvalue_display_proc (%dd);
#
dbmclose (%dd);
#
print	"*** 終了 ***\n";
#
# ------------------------------------------------------------

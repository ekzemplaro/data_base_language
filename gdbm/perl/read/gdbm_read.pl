#! /usr/bin/perl
#
#		gdbm_read.pl
#
#					Oct/21/2010
#
# ----------------------------------------------------------
use	strict;
use	warnings;

use lib '/var/www/data_base/common/perl_common';
use kvalue_manipulate;
#
#
# ----------------------------------------------------------
my $db_file="/var/tmp/gdbm/cities";
#
print	"*** 開始 ***\n";
#
dbmopen (my %dd,$db_file,0644) || die "cannot open DBM";
#
kvalue_manipulate::kvalue_display_proc (%dd);
#
#
dbmclose (%dd);
#
print	"*** 終了 ***\n";
#

# ----------------------------------------------------------

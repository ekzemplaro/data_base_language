#!/usr/bin/perl
#
#	sqlite3/perl/sqlite3_read.pl
#
#				May/19/2011
#
use DBI;
#
use	strict;
use	warnings;
#
use lib '/var/www/data_base/common/perl_common';
use sqlite3_manipulate;
# ---------------------------------------------------------
print "*** 開始 ***\n";
my $db_in = $ARGV[0];
#
#
#
my %dict_aa = sqlite3_manipulate::sqlite3_to_dict_proc ($db_in);
text_manipulate::dict_display_proc (%dict_aa);
#
print "*** 終了 ***\n";
# ---------------------------------------------------------

#!/usr/bin/perl
#
#	perl/delete/sqlite3_delete.pl
#
#				May/19/2011
#
# ---------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use DBI;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use sql_manipulate;
use sqlite3_manipulate;
#
# ---------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
my $db_in_aa = $ARGV[0];
my $id_in = $ARGV[1];
#
print ("$id_in\n");
#
#
my $dbi = DBI->connect  ("dbi:SQLite:$db_in_aa")
		|| die "Cannot connect: $DBI::errstr";
#
sql_manipulate::dbi_delete_proc ($id_in,$dbi);
$dbi->disconnect;
#
my %dict_aa = sqlite3_manipulate::sqlite3_to_dict_proc ($db_in_aa);
text_manipulate::dict_display_proc (%dict_aa);
#
#
print	(encode ('utf-8',"*** 終了 ***\n"));
# ---------------------------------------------------------

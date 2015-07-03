#! /usr/bin/perl
#
#	sqlite3_create.pl
#
#				Jun/08/2015
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use	DBI;
#
use lib '/var/www/data_base/common/perl_common';
use	text_manipulate;
use	sql_manipulate;
#
# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $db_in= $ARGV[0];
#
my %dict_aa = data_prepare_proc ();
#
text_manipulate::dict_display_proc (%dict_aa);
#
my $dbi = DBI->connect  ("dbi:SQLite:$db_in")
		|| die "Cannot connect: $DBI::errstr";

sql_manipulate::drop_table_proc ($dbi);
sql_manipulate::create_table_proc ($dbi);
#
sql_manipulate::table_insert_proc ($dbi,%dict_aa);
#
$dbi->disconnect;
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t0711','郡山',75842,'2005-8-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0712','会津若松',14258,'2005-2-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0713','白河',58641,'2005-5-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0714','福島',46732,'2005-7-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0715','喜多方',27189,'2005-1-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0716','二本松',92139,'2005-4-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0717','いわき',35647,'2005-12-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0718','相馬',82146,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0719','須賀川',64817,'2005-9-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------

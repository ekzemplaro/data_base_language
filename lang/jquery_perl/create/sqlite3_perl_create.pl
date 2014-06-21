#! /usr/bin/perl
#
#	jquery_perl/create/sqlite3_perl_create.pl
#
#
#						May/30/2012
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	DBI;
#
use lib '/var/www/data_base/common/perl_common';
use sql_manipulate;
use text_manipulate;
#
# ----------------------------------------------------------------------
my $db_sqlite3 = "/var/tmp/sqlite3/cities.db";

my %dict_aa = data_prepare_proc ();

my $dbi = DBI->connect  ("dbi:SQLite:$db_sqlite3")
		|| die "Cannot connect: $DBI::errstr";
#
sql_manipulate::drop_table_proc ($dbi);
sql_manipulate::create_table_proc ($dbi);
#
sql_manipulate::table_insert_proc ($dbi,%dict_aa);
#
$dbi->disconnect;
#
print "Content-type: text/html\n\n";
#
#
print "*** OK ***\n";
# ----------------------------------------------------------------------
sub data_prepare_proc
{
		my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t0711','郡山',84200,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0712','会津若松',27800,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0713','白河',58600,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0714','福島',46200,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0715','喜多方',27900,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0716','二本松',92100,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0717','いわき',35700,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0718','相馬',85600,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0719','須賀川',64700,'2005-6-24',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------

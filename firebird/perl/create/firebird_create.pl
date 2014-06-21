#! /usr/bin/perl
#
#	firebird_create.pl
#
#					May/30/2012
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	DBI;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use firebird_manipulate;
#
# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $host     = 'localhost';
my $dbpath   = '/var/tmp/firebird/cities.fdb';
my $user     = 'SYSDBA';
my $password = 'tiger';
#
#
my $data_source = 'dbi:Firebird:' . "host=$host;dbname=$dbpath";

print	("*** pppp ***\n");
my $dbh = DBI->connect($data_source, $user, $password);
unless($dbh) {
	print STDERR "Error : connect.\n";
	exit -1;
}
#
my %dict_aa = data_prepare_proc ();
#
text_manipulate::dict_display_proc (%dict_aa);
#
firebird_manipulate::firebird_drop_proc ($dbh);
firebird_manipulate::firebird_create_proc ($dbh);
firebird_manipulate::firebird_table_insert_proc ($dbh,%dict_aa);
#
$dbh->disconnect;
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t3821','松山',75842,'2005-9-30',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3822','今治',14278,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3823','宇和島',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3824','八幡浜',46132,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3825','新居浜',27859,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3826','西条',92581,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3827','大洲',35497,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3828','伊予',85736,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3829','西予',64827,'2005-5-21',%dict_aa);

	return	%dict_aa;
}
# ----------------------------------------------------------------

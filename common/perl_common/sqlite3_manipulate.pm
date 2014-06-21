#!/usr/bin/perl
#
#	sqlite3_manipulate.pm
#
#				May/19/2011
#
# ---------------------------------------------------------
package	sqlite3_manipulate;
#
use     strict;
use     warnings;
use	utf8;
use	Encode;

use DBI;
#
use lib '/var/www/uchida/data_base/perl_common';
use text_manipulate;
use sql_manipulate;
#
# ---------------------------------------------------------
sub sqlite3_to_dict_proc
{
	my $db_in = $_[0];

my $dbh = DBI->connect  ("dbi:SQLite:$db_in")
		|| die "Cannot connect: $DBI::errstr";

my $res = $dbh->selectall_arrayref ("SELECT * FROM cities");

my %dict_aa;

foreach (@$res)
	{
	my $key = $_->[0];
	my $name = decode ('utf-8', $_->[1]);
	my $population = $_->[2];
	my $date_mod = $_->[3];

	%dict_aa = text_manipulate::dict_append_proc ($key,$name,$population,
		$date_mod,%dict_aa);
#	my %dict_unit = {name=> $name,
#	population=>$population,
#	date_mod=>$date_mod};
#	my %dict_unit = {name=> $_->[1],

#	$dict_aa{$_->[0]} = \%dict_unit;
	}

$dbh->disconnect;

	return  %dict_aa;
}
#
# ---------------------------------------------------------
1;
# ---------------------------------------------------------

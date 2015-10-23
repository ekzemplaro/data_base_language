#! /usr/bin/perl
#
#	firebird_manipulate.pm
#
#						Jun/19/2012
#
# ----------------------------------------------------------------
package	firebird_manipulate;

use	DBI;
use	strict;
use	warnings;
use	utf8;
use	Encode;

# ----------------------------------------------------------------
sub firebird_to_dict_proc
{
	my $db = $_[0];

	my %dict_aa;

#	print "*** firebird_to_dict_proc ***\n";

	my $sth = $db->prepare("SELECT * FROM cities");
	$sth->execute;
	my $num_rows = $sth->rows;
#	print "num_rows = $num_rows\n";
	while (my @result = $sth->fetchrow_array())
		{
		my %dict_unit = ("name"=> decode ('utf-8',$result[1]),
			"population" => $result[2],
			"date_mod" => decode ('utf-8',$result[3]));

		$dict_aa{$result[0]} = \%dict_unit;
		}

	$sth->finish;

	return	%dict_aa;
}


# ----------------------------------------------------------------
sub firebird_drop_proc
{
	my $dbh = $_[0];
	my $sql_str = "drop table cities;";
	my $sth = $dbh->prepare ($sql_str);
	$sth->execute;
	$sth->finish;
}

# ----------------------------------------------------------------
sub firebird_create_proc
{
	my $dbh = $_[0];
	my $sql_str = "create TABLE cities (ID varchar(10),NAME varchar (20),POPULATION int,DATE_MOD date)";
	my $sth = $dbh->prepare ($sql_str);
	$sth->execute;
	$sth->finish;
}

# ----------------------------------------------------------------
sub firebird_table_insert_proc
{
	my ($dbh,%dict_aa) = @_;

	foreach my $key (keys %dict_aa){
		my $sql_str = "insert into cities (ID,NAME,POPULATION,DATE_MOD) "
		. "values ('" . $key . "', '" . ${$dict_aa{$key}}{"name"}
		. "', '" . ${$dict_aa{$key}}{"population"}
		. "', '" . ${$dict_aa{$key}}{"date_mod"} . "')";

		my $sth = $dbh->prepare ($sql_str);
		$sth->execute;
#		print	$sql_str . "\n";
		}
}

# ----------------------------------------------------------------
1;
# ----------------------------------------------------------------

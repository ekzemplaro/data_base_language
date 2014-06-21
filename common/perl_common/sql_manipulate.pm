#! /usr/bin/perl
#
#	sql_manipulate.pm
#
#					May/30/2012
#
# -----------------------------------------------------------------------
package	sql_manipulate;

use	strict;
use	warnings;
use	utf8;
use	Encode;

use DBI;
#
# -----------------------------------------------------------------------
sub mysql_utf8_proc
{
	my $db = $_[0];
	my $sth = $db->prepare("SET NAMeS utf8");
	$sth->execute;
}

# -----------------------------------------------------------------------
sub sql_show_proc
{
	my $db = $_[0];

	print "*** sql_show_proc ***\n";

	my $sth = $db->prepare("SELECT * FROM cities");
	$sth->execute;
	my $num_rows = $sth->rows;
print "num_rows = $num_rows\n";
for (my $it=0; $it<$num_rows; $it++)
	{
	my @a = $sth->fetchrow_array;
	print "$a[0]\t$a[1]\t$a[2]\t$a[3] \n";
	}

$sth->finish;
$db->disconnect;
}

# -----------------------------------------------------------------------
sub dbi_update_proc
{
	my $id_in = $_[0];
	my $population_in = $_[1];
	my $db = $_[2];

print "*** dbi_update_proc *** $id_in\t$population_in\n";

	my $date_mod = text_manipulate::get_date_mod_proc ();
	$date_mod = "\'" . $date_mod . "\'";

	my $ft_aa = "update cities set POPULATION = " . $population_in;
	my $ft_bb = ", DATE_MOD = " . $date_mod;
	my $ft_cc = " where ID = '" . $id_in . "'";
	my $sql_str = $ft_aa . $ft_bb . $ft_cc;

	print $ft_aa . "\n";
	print $ft_bb . "\n";
	print $ft_cc . "\n";
	print $sql_str . "\n";
 
	my $sth = $db->prepare($sql_str);
	$sth->execute;

$sth->finish;
}
# -----------------------------------------------------------------------
sub dbi_delete_proc
{
	my $id_in = $_[0];
	my $db = $_[1];

	my $sql_str = "delete from cities where ID = '" . $id_in ."'";

	print $sql_str . "\n";
 
	my $sth = $db->prepare($sql_str);
	$sth->execute;

	$sth->finish;
}

# -----------------------------------------------------------------------
sub sql_to_dict_proc
{
	my $db = $_[0];

	my $sth = $db->prepare("SELECT * FROM cities");
	$sth->execute;
	my $num_rows = $sth->rows;

	my %dict_aa;

	for (my $it=0; $it<$num_rows; $it++)
		{
		my @aa = $sth->fetchrow_array;
		my $key = $aa[0];
		my $name =  decode ('utf-8',$aa[1]);
		my $population = $aa[2];
		my $date_mod = $aa[3];

		%dict_aa = text_manipulate::dict_append_proc
			($key,$name,$population,$date_mod,%dict_aa);
		}


	$sth->finish;

	return %dict_aa;
}

# -----------------------------------------------------------------------
sub drop_table_proc
{
	my $dbi = $_[0];
#
	my $sql_str = "drop table cities;";
	my $sth = $dbi->prepare ($sql_str);
	$sth->execute;
	$sth->finish;
}
#
# -----------------------------------------------------------------------
sub create_table_proc
{
	my $dbi = $_[0];

	my $sql_str = "create TABLE cities (ID varchar(10) NOT NULL PRIMARY KEY,NAME text,"
		.  "POPULATION int,DATE_MOD text)";
	my $sth = $dbi->prepare ($sql_str);
	$sth->execute;
	$sth->finish;
}
#
# -----------------------------------------------------------------------
sub table_insert_proc
{
	my ($dbi,%dict_aa) = @_;
#	foreach my $key (sort keys %dict_aa){
	foreach my $key (keys %dict_aa){
		my $sql_str = "insert into cities (ID,NAME,POPULATION,DATE_MOD) "
		. "values ('" . $key . "', '" . ${$dict_aa{$key}}{"name"}
		. "', '" . ${$dict_aa{$key}}{"population"}
		. "', '" . ${$dict_aa{$key}}{"date_mod"} . "')";

		my $sth = $dbi->prepare ($sql_str);
		$sth->execute;
		$sth->finish;
#		print	$sql_str . "\n";
		}
#
#	$dbi->disconnect;
}

# -----------------------------------------------------------------------
1;
# -----------------------------------------------------------------------


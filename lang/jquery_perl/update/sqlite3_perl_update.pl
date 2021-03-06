#! /usr/bin/perl
#
#	sqlite3_perl_update.pl
#
#						Jun/23/2010
# ---------------------------------------------------------------------
#
use	strict;
use	warnings;

use JSON;
use	CGI qw (:standard);
#
use	DBI;
use lib '/var/www/data_base/common/perl_common';
use	cgi_manipulate;
use	text_manipulate;
use	sql_manipulate;
# ---------------------------------------------------------------------
#
my $db_in_aa = "/var/tmp/sqlite3/cities.db";
my $dbh = DBI->connect  ("dbi:SQLite:$db_in_aa")
		|| die "Cannot connect: $DBI::errstr";

#
#
print "Content-type: text/html\n\n";
#
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** mysql_perl_update.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it]->{id};
	my $population = $arry_bb[0][$it]->{population};
	print "$id $population<br />";
	sql_manipulate::dbi_update_proc ($id,$population,$dbh);
	$it++;
	}
#
$dbh->disconnect;
#
print "*** sqlite3_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#

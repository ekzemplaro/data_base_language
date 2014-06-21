#! /usr/bin/perl
#
#	firebird_perl_update.pl
#
#						Jun/19/2012
# ---------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
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
my $host     = 'localhost';
my $dbpath   = '/var/tmp/firebird/cities.fdb';
my $user     = 'SYSDBA';
my $password = 'tiger';
#
my $data_source = 'dbi:Firebird:' . "host=$host;dbname=$dbpath";
#
my $dbi = DBI->connect($data_source, $user, $password);
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
	sql_manipulate::dbi_update_proc ($id,$population,$dbi);
	$it++;
	}
#
$dbi->disconnect;
#
print "*** mysql_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#

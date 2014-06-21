#! /usr/bin/perl
#
#	mysql_perl_update.pl
#
#						Nov/22/2010
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
my $constr = 'DBI:mysql:city:host_mysql';
my $user = 'scott';
my $passwd = 'tiger';
my $dbi = DBI->connect($constr, $user, $passwd);
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

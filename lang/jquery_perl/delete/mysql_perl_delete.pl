#! /usr/bin/perl
#
#	mysql_perl_delete.pl
#
#						Jan/19/2011
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
print "*** mysql_perl_delete.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it];
	print "$id <br />";
	sql_manipulate::dbi_delete_proc ($id,$dbi);
	$it++;
	}
#
$dbi->disconnect;
#
print "*** mysql_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#

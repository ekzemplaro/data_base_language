#! /usr/bin/perl
#
#	berkeley_perl_delete.pl
#
#						Oct/21/2010
# ---------------------------------------------------------------------
#
use	strict;
use	warnings;
#
use JSON;
use DB_File;
#
use	CGI qw (:standard);
#
use	DBI;
use lib '/var/www/data_base/common/perl_common';
use	cgi_manipulate;
#
my $db_file="/var/tmp/berkeley/cities.db";
dbmopen (my %dd,$db_file,0644) || die "cannot open DBM";
#
#
print "Content-type: text/html\n\n";
#
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** berekeley_perl_delete.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it];
	print "$id <br />";
	delete ($dd{$id});
	$it++;
	}
#
dbmclose (%dd);
#
print "*** berkeley_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#

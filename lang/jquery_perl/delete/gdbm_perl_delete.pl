#! /usr/bin/perl
#
#	gdbm_perl_delete.pl
#
#						Oct/21/2010
#
# ---------------------------------------------------------------------
use	strict;
use	warnings;

use	CGI qw (:standard);
#
use	DBI;
use lib '/var/www/data_base/common/perl_common';
use	cgi_manipulate;
#
# ---------------------------------------------------------------------
my $db_file="/var/tmp/gdbm/cities";
#
dbmopen (my %dd,$db_file,0644) || die "cannot open DBM";
#
print "Content-type: text/html\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** gdbm_perl_delete.pl *** start ***<br />";
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
print "*** gdbm_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#

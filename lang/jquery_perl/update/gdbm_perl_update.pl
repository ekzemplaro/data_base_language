#! /usr/bin/perl
#
#	gdbm_perl_update.pl
#
#						Sep/24/2010
#
# ---------------------------------------------------------------------
use	strict;
use	warnings;

use JSON;
use	CGI qw (:standard);
#
use	DBI;
use lib '/var/www/data_base/common/perl_common';
use	cgi_manipulate;
use	text_manipulate;
use	kvalue_manipulate;
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
print "*** gdbm_perl_update.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it]->{id};
	my $population = $arry_bb[0][$it]->{population};
	print "$id $population<br />";
	%dd=kvalue_manipulate::kvalue_update_proc ($id,$population,%dd);
	$it++;
	}
#
dbmclose (%dd);
#
print "*** gdbm_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#

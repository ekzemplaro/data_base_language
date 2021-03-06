#! /usr/bin/perl
#
#	mongo_perl_update.pl
#
#						Jun/25/2012
# ---------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use JSON;
use	CGI qw (:standard);
#
use	MongoDB;
use	MongoDB::OID;
#
use lib '/var/www/data_base/common/perl_common';
use	cgi_manipulate;
use	text_manipulate;
use	mongo_manipulate;
# ---------------------------------------------------------------------
#
my $conn = MongoDB::Connection->new( host => 'localhost', port => 27017 );
my $db   = $conn->city_db;
my $col = $db -> saitama;
#
print "Content-type: text/html\n\n";
#
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** mongo_perl_update.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it]->{id};
	my $population = $arry_bb[0][$it]->{population};
	print "$id $population<br />";
	mongo_manipulate::mongo_update_proc ($col,$id,$population);
	$it++;
	}
#
#
print "*** mongo_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#

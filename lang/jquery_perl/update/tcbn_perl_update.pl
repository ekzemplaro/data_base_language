#! /usr/bin/perl
#
#	tcbn_perl_update.pl
#
#						Sep/21/2010
# ---------------------------------------------------------------------
use	strict;
use	warnings;
#
use	TokyoCabinet;
use	JSON;
#
use	CGI qw (:standard);
#
use	DBI;
use lib '/var/www/data_base/common/perl_common';
use	cgi_manipulate;
use	text_manipulate;
use	tcbn_manipulate;
use	kvalue_manipulate;
#
# ---------------------------------------------------------------------
my $file_in = '/var/tmp/tokyo_cabinet/cities.tcb';
#
my $bdb = TokyoCabinet::BDB->new();
if(!$bdb->open($file_in, $bdb->OWRITER | $bdb->OCREAT)){
	my $ecode = $bdb->ecode();
	printf STDERR ("open error: %s\n", $bdb->errmsg($ecode));
}
#
#
#
print "Content-type: text/html\n\n";
#
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** mcached_perl_update.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it]->{id};
	my $population = $arry_bb[0][$it]->{population};
	print "$id $population<br />";

	tcbn_manipulate::data_update_proc ($bdb,$id,$population);
	$it++;
	}
#
print "*** tcbn_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#

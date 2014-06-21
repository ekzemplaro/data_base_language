#! /usr/bin/perl
#
#	master_perl_update.pl
#
#						Apr/14/2010
# ---------------------------------------------------------------------
#
use JSON::Syck;
use	CGI qw (:standard);
#
use lib '/var/www/uchida/data_base/common/perl_common';
use cgi_manipulate;
#
        print "Content-type: text/html\n\n";
#
	@arry = cgi_manipulate::parse_parameter ();
#
	print "*** master_perl_update.pl *** start ***<br />";

#	foreach (@arry)
	$it=0;
	foreach (@{$arry[0]})
	{
	$id = $arry[0][$it]->{id};
	$population = $arry[0][$it]->{population};
	print "$id $population<br />";
	$it++;
	}
#
	print "*** master_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#

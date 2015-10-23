#! /usr/bin/perl
#
#	cgi_manipulate.pm
#
#						Jun/23/2010
# ---------------------------------------------------------------------
package	cgi_manipulate;

use	strict;
use	warnings;
#
use	JSON;
use	CGI qw (:standard);
#
#
# ---------------------------------------------------------------------
sub	parse_parameter
{
	my $cur = CGI->new ();
	my $my_data = $cur->param("my_data");
#
	print "check parse_parameter *** aaaa<p />";
#
	my $data_aa = decode_json ($my_data);
#	my @arry_aa= $data_aa;
#
#	return	@arry_aa;
	return	$data_aa;
#
}
# ---------------------------------------------------------------------
1;
# ---------------------------------------------------------------------
#

#! /usr/bin/perl
#
#	read/json_perl_read.pl
#
#					Mar/29/2010
#
#
# ------------------------------------------------------------------
use	strict;
use	warnings;
# ------------------------------------------------------------------
my $str_json = "";
my $file_in= "/var/tmp/json/cities.json";
open (IN,$file_in);
while (my $line = <IN>)
	{
	$str_json = $str_json . $line;
	}
#
close (IN);
#
print "Content-type: text/json\n\n";
print	$str_json;
#
# ------------------------------------------------------------------

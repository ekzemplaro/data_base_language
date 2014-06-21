#! /usr/bin/perl
#
#	perl_common/file_io.pm
#
#					May/06/2011
#
#
package	file_io;
#
use strict;
use warnings;
use utf8;
use	Encode;

# ----------------------------------------------------------------------
sub string_read_proc 
{
	my $file_in = $_[0];

	my $str_out = "";
	open (IN,$file_in);
	while (my $line = <IN>)
		{
#		$str_out = $str_out . (decode ('utf-8', $line));
		$str_out = $str_out . $line;
		}

	close (IN);

	return	$str_out;
}

# ----------------------------------------------------------------------
sub string_write_proc 
{
	my $file_in = $_[0];
	my $str_in = $_[1];
#
	open (OUT,">$file_in");
#
	print OUT $str_in;
#	print OUT encode ('utf-8',$str_in);
	close (OUT);
#
}

# ----------------------------------------------------------------------
1;

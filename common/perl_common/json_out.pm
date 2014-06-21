#! /usr/bin/perl
#
#	perl_common/json_out.pm
#
#					Nov/04/2010
# ----------------------------------------------------------------------
#
package json_out;
#
use	strict;
use	warnings;
use	utf8;

use	Encode;
use	JSON;
#
# ----------------------------------------------------------------------
sub json_display_proc
{
	my $str_json = $_[0];
#
#	my $data = decode_json (encode ('utf-8',$str_json));
	my $data = decode_json ($str_json);
#
	my @arry_data=$data->{cities};
#
	my $it=0;
	foreach ( @{$arry_data[0]} )
	{
	my $id = $arry_data[0][$it]->{id};
	my $name = $arry_data[0][$it]->{name};
#
	my $population = $arry_data[0][$it]->{population};
	my $date_mod = $arry_data[0][$it]->{date_mod};
	print $id . "\t";
#
	if (utf8::is_utf8 ($name))
		{
#		print decode ('utf-8',$name)
		print encode ('utf-8',$name)
#		print $name;
		}
	else
		{
		print encode ('utf-8',$name)
#		print $name;
		}
#
	print "\t" . $population . "\t";
	print $date_mod . "\n";
	$it++;
	}
}
#
# ----------------------------------------------------------------------
1;
# ----------------------------------------------------------------------

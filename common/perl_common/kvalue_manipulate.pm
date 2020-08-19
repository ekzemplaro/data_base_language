#! /usr/bin/perl
#
#	kvalue_manipulate.pm
#
#					Sep/14/2010
#
#
# ----------------------------------------------------------------
package	kvalue_manipulate;
use	strict;
use	warnings;
use	utf8;

use	JSON;
use	Encode;
# ----------------------------------------------------------------
sub kvalue_update_proc
{
	my $id_in=$_[0];
	my $population_in=$_[1];
	my %dd_in = @_;

	print "*** berkeley_update_proc ***\t";

	print $id_in . "\t";
	print $population_in . "\n";
	my $out_str = $dd_in{$id_in};
#
	my $data=decode_json ($out_str);
	$data->{population} = $population_in;
	my $date_mod = text_manipulate::get_date_mod_proc ();
	$data->{date_mod} = $date_mod;
#
	my $json_new = encode_json ($data);
	print $out_str . "\n";
	print $json_new . "\n";
	$dd_in{$id_in} = $json_new;

	return %dd_in;
}

# ----------------------------------------------------------------
sub kvalue_display_proc
{
	my %dd_in = @_;

	foreach my $key (keys %dd_in)
	{
	my $json_str = $dd_in{$key};
#
	json_display_proc ($key,$json_str);
	}
}

# ----------------------------------------------------------------
sub json_display_proc
{
	my $key=$_[0];
	my $out_str=$_[1];
	my $data=decode_json ($out_str);
#	my $data=decode_json (encode ('utf-8',$out_str));
	my $name = $data->{name};
	my $population = $data->{population};
	my $date_mod = $data->{date_mod};
#
	print $key . "\t";
	print encode ('utf-8',$name) . "\t";
	print $population . "\t";
	print $date_mod . "\n";
}

# ----------------------------------------------------------------
1;
# ----------------------------------------------------------------

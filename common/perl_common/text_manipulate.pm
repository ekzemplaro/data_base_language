#! /usr/bin/perl
#
#	perl_common/text_manipulate.pm
#
#					Dec/01/2011
#
#
package	text_manipulate;
#
use strict;
use warnings;
use utf8;
use	Encode;

# ----------------------------------------------------------------------
sub	text_read_proc_exec
{
	my ($file_in,$delimit) = @_;

	if (! open FILE,$file_in){
		die "*** file not exists! ***\n";
		}

	my %dict_aa;

	while (<FILE>)
	{
		chomp;
#		my @items = split /\s+/;
		my @items = split /$delimit/;

		my %dict_unit = ("name"=> decode ('utf-8',$items[1]),
			"population" => $items[2],
			"date_mod" => $items[3]);

		$dict_aa{$items[0]} = \%dict_unit;
	}

	close (FILE);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
sub	text_read_proc
{
	my $file_in = $_[0];
#	my $delimit = "\t";
	my $delimit = "\t";

	my %dict_aa = text_read_proc_exec ($file_in,$delimit);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
sub	dict_display_proc
{
	my %dict_aa = @_;

	foreach my $key (sort keys %dict_aa){
		if (($key ne '_id') && ($key ne '_rev'))
			{
		my $out_str = $key . "\t";
		$out_str .=  ${$dict_aa{$key}}{"name"} . "\t";
		$out_str .= ${$dict_aa{$key}}{"population"} . "\t";
		$out_str .= ${$dict_aa{$key}}{"date_mod"} . "\n";
		print (encode ('utf-8',$out_str));
#		print $out_str;
			}
	}
}

# ----------------------------------------------------------------------
sub	text_write_proc_exec
{
	my ($delimit,$file_out,%hash) = @_;

	open (OUT,">$file_out");

	foreach my $key (sort keys %hash){
		my $out_str = $key . $delimit;
		$out_str .=  ${$hash{$key}}{"name"} . $delimit;
		$out_str .= ${$hash{$key}}{"population"} . $delimit;
		$out_str .= ${$hash{$key}}{"date_mod"} . "\n";

		print OUT (encode ('utf-8',$out_str));
#		print OUT ($out_str);
	}

	close (OUT);
}

# ----------------------------------------------------------------------
sub	text_write_proc
{
	my ($file_text,%dict_aa) = @_;

	my $delimit = "\t";

	text_write_proc_exec ($delimit,$file_text,%dict_aa);
}

# ----------------------------------------------------------------------
sub	dict_update_proc
{
	my ($id_in,$population_in,%hash) = @_;

	my $date_mod = get_date_mod_proc ();

	my $key = $id_in;

	${$hash{$key}}{"population"} = $population_in;
	${$hash{$key}}{"date_mod"} = $date_mod;

	return	%hash;
}

# ----------------------------------------------------------------------
sub	dict_delete_proc
{
	my ($id_in,%hash) = @_;

	my $key = $id_in;

	if (exists $hash{$key})
		{
		delete $hash{$key};
		}

	return	%hash;
}

# ----------------------------------------------------------------------
sub	dict_append_proc
{
	my ($id_in,$name_in,$population_in,$date_mod_in,%hash) = @_;

	my %dict_unit = ("name"=> $name_in, "population" => $population_in,
			"date_mod" => $date_mod_in);

	$hash{$id_in} = \%dict_unit;

	return	%hash;
}

# ----------------------------------------------------------------------
sub	csv_read_proc
{
	my $file_in = $_[0];
#	my $delimit = "\t";
	my $delimit = ",";

	my %dict_aa = text_read_proc_exec ($file_in,$delimit);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
sub	csv_write_proc
{
	my ($file_text,%dict_aa) = @_;

	my $delimit = ",";

	text_write_proc_exec ($delimit,$file_text,%dict_aa);
}

# ----------------------------------------------------------------------
sub read_proc 
{
	my $file_in = $_[0];
	my @arry_data= ();
	open (IN,$file_in);
	while (my $line = <IN>)
		{
		$line = (decode ('utf-8', $line));
		chomp ($line);
		my @cols = split (/[ \t]+/,$line);

		my $unit_aa = {id=>$cols[0],
		name=>$cols[1],
		population=>$cols[2],
		date_mod=>$cols[3]};
		push (@arry_data,$unit_aa);
		}
	close (IN);
#
	my $data = {'cities' => [@arry_data]};
#
	return	$data;
}

# ----------------------------------------------------------------------
sub get_date_mod_proc
{
	my ($mday,$mon,$year) = (localtime (time))[3..5];
	$mon += 1;
	$year += 1900;
	my $date_mod = "$year-$mon-$mday";

	return $date_mod;
}

# ----------------------------------------------------------------------
1;
# ----------------------------------------------------------------------

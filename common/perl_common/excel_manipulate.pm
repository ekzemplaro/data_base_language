#! /usr/bin/perl
#
#	perl_common/excel_manipulate.pm
#
#					Apr/15/2011
#
# ------------------------------------------------------------------
package	excel_manipulate;

# ------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use	Spreadsheet::ParseExcel;
use	Spreadsheet::WriteExcel;
#
# ------------------------------------------------------------------
sub	excel_read_proc
{
	my $file_in = $_[0];

	my %hash;

my $oExcel = new Spreadsheet::ParseExcel;
my $oBook = $oExcel->Parse($file_in);

my($iR, $iC, $oWkS, $oWkC);

foreach my $oWkS (@{$oBook->{Worksheet}})
	{
	for(my $iR = $oWkS->{MinRow} ; 
		defined $oWkS->{MaxRow} && $iR <= $oWkS->{MaxRow} ; $iR++)
		{
		my $id = $oWkS->{Cells}[$iR][0]->Value;
#		my $name = encode ('utf-8',$oWkS->{Cells}[$iR][1]->Value);
		my $name = $oWkS->{Cells}[$iR][1]->Value;
		my $population = $oWkS->{Cells}[$iR][2]->Value;
		my $date_mod = $oWkS->{Cells}[$iR][3]->Value;

		my %dict_unit = ("name"=> $name, "population" => $population,
			"date_mod" => $date_mod);

		$hash{$id} = \%dict_unit;
		}
	}

	return	%hash;
}

# ------------------------------------------------------------------
sub excel_write_proc
{
	my ($file_excel,%hash) = @_;

	my $workbook  = Spreadsheet::WriteExcel->new($file_excel);
	my $worksheet = $workbook->add_worksheet();

	my $nn = 0; 
	foreach my $key (sort keys %hash){
		my $name = ${$hash{$key}}{"name"};
		my $population = ${$hash{$key}}{"population"};
		my $date_mod = ${$hash{$key}}{"date_mod"};

		$worksheet->write ($nn,0,$key);
		$worksheet->write ($nn,1,$name);
		$worksheet->write ($nn,2,$population);
		$worksheet->write ($nn,3,$date_mod);

		$nn += 1;
	}

}

# ------------------------------------------------------------------
1;
# ------------------------------------------------------------------

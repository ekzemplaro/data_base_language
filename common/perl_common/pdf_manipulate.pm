#!/usr/bin/perl
#
#	pdf_manipulate.pl
#
#					Jun/29/2012
#
# ----------------------------------------------------------------
package	pdf_manipulate;
#
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use PDF::API2;
use PDF::API2::Resource::CIDFont::CJKFont;
use Jcode;

#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
# ----------------------------------------------------------------
sub pdf_to_dict_proc
{
	my $file_pdf = $_[0];

	my $command = "pdftotext -layout " . $file_pdf . " -";

	my @line = qx{$command};
#
	my $delimit = " +";
	my %dict_aa;
	foreach my $line_col (@line)
		{
		chomp ($line_col);
		if (4 < length ($line_col))
			{
			my @items = split (/$delimit/,$line_col);
			my $key = $items[0];
			my $name = decode ('utf-8',$items[1]);
			%dict_aa = text_manipulate::dict_append_proc
				($key,$name,$items[2],$items[3],%dict_aa);
			}
		}

	return	%dict_aa;
}

# ----------------------------------------------------------------
sub dict_to_pdf_proc
{
	my ($file_pdf,%dict_aa) = @_;
	my $pdf = PDF::API2->new;

	my $fnt = $pdf->cjkfont('KozMin', &encode(), "utf-8");
#
	my $page = $pdf->page;
	$page->mediabox('A4');
#
	my $gfx = $page->gfx;
#
	my $yy = 700;
	foreach my $key (sort keys %dict_aa){
		my $out_str = $key;
		$gfx->textlabel(50,$yy,$fnt,20,$out_str);
		$out_str =  ${$dict_aa{$key}}{"name"};
		$gfx->textlabel(175,$yy,$fnt,20,$out_str);
		$out_str = ${$dict_aa{$key}}{"population"};
		$gfx->textlabel(300,$yy,$fnt,20,$out_str);
		$out_str = ${$dict_aa{$key}}{"date_mod"};
		$gfx->textlabel(400,$yy,$fnt,20,$out_str);

		$yy = $yy - 25;
		}
#
	$pdf->saveas($file_pdf);
	$pdf->end;
}

# ----------------------------------------------------------------
1;
# ----------------------------------------------------------------

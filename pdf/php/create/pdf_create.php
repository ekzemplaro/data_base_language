#! /usr/bin/php
<?php
// ----------------------------------------------------------------
//
//	pdf_create.php
//
//
//						Mar/23/2018
//
// ----------------------------------------------------------------
require_once ('/var/www/lib/php/tcpdf/tcpdf.php');

// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
// ----------------------------------------------------------------
function dict_to_pdf_proc ($pdf_file,$dict_aa)
{
	$pdf=new TCPDF();
	$pdf->setPrintHeader( false );
	$pdf->AddPage();
	$font_path = '/var/www/lib/php/IPAfont00303/ipag.ttf';

	if (file_exists($font_path)) {
		$font = new TCPDF_FONTS();
		$fontX = $font->addTTFfont($font_path);
		$pdf->SetFont($fontX , '', 10,'',true);
		}

	$width = 40;
	$height = 10;

	foreach ($dict_aa as $key => $value)
		{
		$name = $value['name'];
		$population = $value['population'];
		$date_mod = $value['date_mod'];

		if (($key != '_id') && ($key != '_rev'))
			{
			print "$key\t";
			print "$name\t";
			print "$population\t";
			print "$date_mod\n";
			$pdf->Cell($width,$height,$key,0,0);
			$pdf->Cell($width,$height,$name,0,0);
			$pdf->Cell($width,$height,$population,0,0);
			$pdf->Cell($width,$height,$date_mod,0,1);
			}
		}

	$pdf->Output($pdf_file,'F');
}

// ----------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t2381','名古屋',72534,'2002-5-14');
$dict_aa = dict_append_proc ($dict_aa,'t2382','豊橋',63473,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t2383','岡崎',57982,'2002-9-01');
$dict_aa = dict_append_proc ($dict_aa,'t2384','一宮',46329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t2385','蒲郡',31765,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t2386','常滑',29184,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t2387','大府',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t2388','瀬戸',91578,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t2389','犬山',79461,'2002-7-8');


$pdf_file = $argv[1];
dict_to_pdf_proc ($pdf_file,$dict_aa);

fputs (STDERR,"*** 終了 ***\n");
// ----------------------------------------------------------------
?>


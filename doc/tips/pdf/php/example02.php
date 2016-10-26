#! /usr/bin/php
<?php
// ----------------------------------------------------------------------
require_once ('/var/www/lib/php/tcpdf/tcpdf.php');
date_default_timezone_set('Asia/Tokyo');

$pdf = new TCPDF("L", "mm", "A4", true, "UTF-8" );
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);
$pdf->AddPage();

$font_path = '/var/www/lib/php/IPAfont00303/ipag.ttf';
if (file_exists($font_path)) {
	$font = new TCPDF_FONTS();
	$fontX = $font->addTTFfont($font_path);
	$pdf->SetFont($fontX , '', 10,'',true);
	}

$pdf->Text(0, 0, "おはよう。" );
$pdf->Text(30, 0, "こんばんは。" );
$pdf->Text(60, 0, "こんにちは。" );

$pdf->Text(0, 15, "美しい日本語のフォントを表示" );

// $pdf->Output("cd_cover_template.pdf", "I");

// $pdf->Output();
$pdf->Output ('/tmp/t02.pdf','F');
// ----------------------------------------------------------------------
?>

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
$pdf->SetFont($fontX , '', 20,'',true);
$pdf->Text(30, 0, "こんばんは。" );
$pdf->SetFont($fontX , '', 10,'',true);
$pdf->Text(60, 20, "こんにちは。" );

$pdf->SetFont($fontX , '', 16,'',true);
$pdf->Text(0, 40, "美しい日本語のフォントを表示" );

$pdf->Line (5, 100, 290, 100);
$pdf->Line (5, 120, 290, 120);


$line_style = array ('width' => 0.5, 'color' => array(0xff, 0, 0) );
$body_style = array ("all" => $line_style );
$pdf->Rect (75,75, 100, 100, 'D', $body_style );

// $pdf->Output();
$pdf->Output ('/tmp/t03.pdf','F');
// ----------------------------------------------------------------------
?>

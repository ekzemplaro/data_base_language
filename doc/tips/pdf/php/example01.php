#! /usr/bin/php
<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

require_once ('/var/www/lib/php/tcpdf/tcpdf.php');

//=============================================================================
//   main
//=============================================================================

function test() {
	// initiate PDF
//	$pdf = new TCPDF("L", "mm", "A4", true, "UTF-8" );
	$pdf = new TCPDF();
	$pdf->setPrintHeader(false);
	$pdf->setPrintFooter(false);
        $pdf->SetMargins(0, 0, 0);		// 用紙の余白を設定
        $pdf->SetCellPadding(0);		// セルのパディングを設定
        $pdf->SetAutoPageBreak(false);	// 自動改ページ
	$pdf->setDisplayMode('default');	// ズーム設定

	$pdf->AddPage();

	$font_path = '/var/www/lib/php/IPAfont00303/ipag.ttf';
	if (file_exists($font_path)) {
		$font = new TCPDF_FONTS();
		$fontX = $font->addTTFfont($font_path);
		$pdf->SetFont($fontX , '', 16,'',true);
	}

	$str_out = "今晩は。Oct/19/2016";
	$pdf->Write(0, $str_out, '', 0, 'L', true, 0, false, false, 0);
	$pdf->Write(0, $str_out, '', 0, 'C', true, 0, false, false, 0);
	$pdf->Write(0, $str_out, '', 0, 'R', true, 0, false, false, 0);

	$txt = "こんにちは。";

	$pdf->Write(0, $txt, '', 0, 'C', true, 0, false, false, 0);

	$pdf->writeHTMLCell(100, 50, 20, 40, '<div style="text-align:right">あいうえお<br>999,999,999<span style="font-size:20pt; color:#ff0000;">円</span><br>Hello world!</div>', array('TBLR' => array('width' => 0.1)));


$left = 5;
$top = 5;
$width = 200;
$height = 285;
$line_height = 30;

	$ly = 100;
	$pdf->Line( $left, $ly, $left + $width, $ly );

	$ly = 120;
	$pdf->Line( $left, $ly, $left + $width, $ly );

	$ly = 200;

	$pdf->Line (20, $ly, 190, $ly );
	$pdf->Line (20, 200, 190, 220);
	$pdf->Line (20, 220, 190, 220);

$line_style = array ('width' => 1.5, 'color' => array(0, 0, 0) );
$body_style = array ("all" => $line_style );

	$pdf->Rect (5,5, 200, 285, 'D', $body_style );
	$pdf->Rect (20,20, 170, 255, 'D', $body_style );

//	$pdf->Output ();
	$pdf->Output ('/tmp/t01.pdf','F');

}

// -----------------------------------------------------------------------
date_default_timezone_set('Asia/Tokyo');
test();
// -----------------------------------------------------------------------
?>

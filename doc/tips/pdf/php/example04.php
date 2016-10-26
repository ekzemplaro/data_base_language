<?php
// ----------------------------------------------------------------------
//	example04.php
//
//						Oct/25/2016
// ----------------------------------------------------------------------
require_once ('/var/www/lib/php/tcpdf/tcpdf.php');

fputs (STDERR,"*** 開始 ***\n");

$pdf = new TCPDF ("L","mm","A4",true,"UTF-8");
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);
$pdf->AddPage();

$font_path = '/var/www/lib/php/IPAfont00303/ipag.ttf';
if (file_exists($font_path)) {
	$font = new TCPDF_FONTS ();
	$fontX = $font->addTTFfont($font_path);
	$pdf->SetFont($fontX ,'', 10,'',true);
	}

first_page ($pdf,$fontX);

$pdf->AddPage();

second_page ($pdf,$fontX);

$pdf->Output();

fputs (STDERR,"*** 終了 ***\n");
// ----------------------------------------------------------------------
function first_page ($pdf,$fontX)
{
$pdf->SetFont($fontX , '',10,'',true);
$pdf->Text(0, 0, "第１ページ" );

$pdf->SetFont($fontX , '', 20,'',true);
$pdf->Text(30, 0, "こんばんは。" );
$pdf->Text(60, 20, "こんにちは。" );

$pdf->Text(0, 40, "美しい日本語のフォントを表示" );

$pdf->Line (5, 100, 290, 100);
$pdf->Line (5, 120, 290, 120);


$line_style = array ('width' => 0.5, 'color' => array(0xff, 0, 0) );
$body_style = array ("all" => $line_style );
$pdf->Rect (75,75, 100, 100, 'D', $body_style);

}

// ----------------------------------------------------------------------
function second_page ($pdf,$fontX)
{
$pdf->SetFont($fontX , '',10,'',true);
$pdf->Text(0, 0, "第２ページ" );

$pdf->SetFont($fontX , '', 20,'',true);
$pdf->Text(30, 0, "こんばんは。" );
$pdf->Text(60, 20, "こんにちは。" );

$pdf->Line (5, 100, 290, 100);
$pdf->Line (5, 120, 290, 120);


$line_style = array ('width' => 0.5, 'color' => array(0xff,0xff, 0) );
$body_style = array ("all" => $line_style );
$pdf->Rect (75,75, 100, 100, 'D', $body_style);

}

// ----------------------------------------------------------------------
?>

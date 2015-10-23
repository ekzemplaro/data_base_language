#! /usr/bin/php
<?php
//
//	xlsx_manipulate.php
//
//					Jul/30/2013
//
// ----------------------------------------------------------------
// $path="/var/www/data_base/common/php_common";
// set_include_path (get_include_path() . PATH_SEPARATOR . $path);

require_once '/var/www/Classes/PHPExcel.php';
require_once '/var/www/Classes/PHPExcel/Writer/Excel2007.php';
// ----------------------------------------------------------------
function xlsx_write_proc ($xlsx_file,$dict_aa)
{
	$objPHPExcel = new PHPExcel();

	$objPHPExcel->getProperties()->setCreator ("Uchida Masatomo");
	$objPHPExcel->getProperties()->setLastModifiedBy ("Uchida Masatomo");
	$objPHPExcel->getProperties()->setTitle("Office 2007 XLSX Example Document");
	$objPHPExcel->getProperties()->setSubject("Office 2007 XLSX Example Document");
	$objPHPExcel->getProperties()->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.");

	$nn = 1;
	foreach ($dict_aa as $key => $value)
		{
		$objPHPExcel->setActiveSheetIndex(0)
			->setCellValue('A'. $nn, $key)
			->setCellValue('B'. $nn, $value['name'])
			->setCellValue('C'. $nn, $value['population'])
			->setCellValue('D'. $nn, $value['date_mod']);
		$nn += 1;
		}

$objPHPExcel->getActiveSheet()->setTitle('Example');

	$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
	$objWriter->save ($xlsx_file);
}

// ----------------------------------------------------------------
?>

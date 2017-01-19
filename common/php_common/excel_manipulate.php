<?php
//
//	excel_manipulate.php
//
//					Apr/14/2011
//
// ----------------------------------------------------------------
error_reporting(E_ALL);

require_once '/var/www/Classes/PHPExcel/IOFactory.php';


class MyReadFilter implements PHPExcel_Reader_IReadFilter
{
	public function readCell($column, $row, $worksheetName = '') {

		return true;
	}
}

// ----------------------------------------------------------------
function excel_read_proc ($file_excel)
{
	$dict_aa = array ();

	$objPHPExcel = PHPExcel_IOFactory::load($file_excel);

	$sheet = $objPHPExcel->getActiveSheet();

for ($it=1; $it<= 100; $it++)
{
	$id = $sheet->getCellByColumnAndRow (0,$it) -> getValue ();

	if ($id == "")
		{
		break;
		}

	$name = $sheet->getCellByColumnAndRow (1,$it) -> getValue ();
	$population = $sheet->getCellByColumnAndRow (2,$it) -> getValue ();
	$date_mod = $sheet->getCellByColumnAndRow (3,$it) -> getValue ();

	$dict_unit = array ();
	$dict_unit['name'] = $name;
	$dict_unit['population'] = $population;
	$dict_unit['date_mod'] = $date_mod;
	$dict_aa[$id]= $dict_unit;
}
	return	$dict_aa;
}


// ----------------------------------------------------------------
function excel_write_proc ($excel_file,$dict_aa)
{
date_default_timezone_set('Europe/London');
$objPHPExcel = new PHPExcel();

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



$objPHPExcel->getActiveSheet()->setTitle('Cities');

$objPHPExcel->setActiveSheetIndex(0);

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');

$objWriter->save ($excel_file);
}

// ----------------------------------------------------------------
?>

<?php
//
//	xlsx_manipulate.php
//
//					Sep/09/2018
//
// ----------------------------------------------------------------
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Reader\Xlsx as Reader;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx as Writer;;

// ----------------------------------------------------------------
function xlsx_write_proc ($xlsx_file,$dict_aa)
{
	$spreadsheet = new Spreadsheet();
	$sheet = $spreadsheet->getActiveSheet();

	$nn = 1;
	foreach ($dict_aa as $key => $value)
		{
		$cell = 'A' . $nn;
		$sheet->setCellValue($cell,$key);
		$cell = 'B' . $nn;
		$sheet->setCellValue($cell,$value['name']);
		$cell = 'C' . $nn;
		$sheet->setCellValue($cell,$value['population']);
		$cell = 'D' . $nn;
		$sheet->setCellValue($cell,$value['date_mod']);
		$nn += 1;
		}

	$writer = new Writer($spreadsheet);
	$writer->save($xlsx_file);
}

// ----------------------------------------------------------------
function xlsx_read_proc ($xlsx_file)
{
	$dict_aa = array ();

	$reader = new Reader();
	$spreadsheet = $reader->load($xlsx_file);

	$sheet = $spreadsheet->getActiveSheet();

	for ($it=1; $it<= 100; $it++)
		{
		$dict_unit = array ();

		$id = $sheet->getCell ('A' . $it) -> getValue ();

		if ($id == "")
			{
			break;
			}

		$dict_unit['name'] = $sheet->getCell ('B' . $it) -> getValue ();
	$dict_unit['population'] = $sheet->getCell ('C' . $it) -> getValue ();
	$dict_unit['date_mod'] = $sheet->getCell ('D' . $it) -> getValue ();

		$dict_aa[$id]= $dict_unit;
		}

	return	$dict_aa;
}

// ----------------------------------------------------------------

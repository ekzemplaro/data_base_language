// ---------------------------------------------------------------------
//
//	poi_common.js
//
//					Sep/29/2015
//
// ---------------------------------------------------------------------
importPackage (java.io)
importPackage (org.apache.poi.xssf.usermodel)
importPackage (org.apache.poi.ss.usermodel)

// ---------------------------------------------------------------------
function getAnchorX (sheet,xInPixel)
{
	var rvalue = [0,0]

	var xInEMU = xInPixel * XSSFShape.EMU_PER_PIXEL
	var currentInXEMU = 0

	var row = sheet.getRow(0)

        if (row == null) {
            row = sheet.createRow(0)
        }

        for (var columnNum = 0;; columnNum++) {
            if (row.getCell(columnNum) == null) {
                row.createCell(columnNum)
            }

            if (sheet.getColumnWidth(columnNum) == sheet.getDefaultColumnWidth() * 256) {
                // Excelのデフォルト値は違うので明示的に設定する
                sheet.setColumnWidth(columnNum, 9 * 256)
            }

            // Excelでは256columnWidthが8ピクセル
            var columnWidthInEMU = sheet.getColumnWidth(columnNum) / 256 * 8 * XSSFShape.EMU_PER_PIXEL
            if (xInEMU < currentInXEMU + columnWidthInEMU) {
           rvalue = [columnNum, xInEMU - currentInXEMU]
			break
            }
            currentInXEMU += columnWidthInEMU

        }

	return	rvalue
}

// ---------------------------------------------------------------------
function getAnchorY (sheet,yInPixel)
{
	var rvalue = [0,0]
	var yInEMU = yInPixel * XSSFShape.EMU_PER_PIXEL
	var currentYInEMU = 0


        for (var rowNum = 0;; rowNum++) {
            var currentRow = sheet.getRow(rowNum)
            if (currentRow == null) {
                currentRow = sheet.createRow(rowNum)
            }

            if (currentRow.getHeight() == sheet.getDefaultRowHeight()) {
                // Excelのデフォルト値は違うので明示的に設定する
                currentRow.setHeightInPoints(13.5)
            }

            // 行の高さ（EMU）
            // ※row.getHeight()は1/20ポイント単位
            var rowHeightInEMU = parseInt ((currentRow.getHeight() / 20.0 * XSSFShape.EMU_PER_POINT))
            if (yInEMU < currentYInEMU + rowHeightInEMU) {
		rvalue = [rowNum, (yInEMU - currentYInEMU)]
		break
            }
            currentYInEMU += rowHeightInEMU
	}

	return	rvalue
}

// ---------------------------------------------------------------------
function workbook_out_proc (workbook,xlsx_out)
{
	var file = new File (xlsx_out)

	var out = new FileOutputStream(file)
	workbook.write(out)
	out.close ()
}

// ---------------------------------------------------------------------
function workbook_read_proc (xlsx_in)
{
	var workbook = new XSSFWorkbook ()

	var fi=new FileInputStream (xlsx_in)
	workbook =new XSSFWorkbook(fi)
	fi.close()

	return	workbook
}

// ---------------------------------------------------------------------
function draw_circle_proc
	(sheet,drawing,pos_center,radius,color)
{
	var xx_range = [pos_center[0] - radius,pos_center[0] + radius]
	var yy_range = [pos_center[1] - radius,pos_center[1] + radius]


        var startX = getAnchorX (sheet,xx_range[0])
        var endX = getAnchorX (sheet,xx_range[1])
        var startY = getAnchorY (sheet,yy_range[0])
        var endY = getAnchorY (sheet,yy_range[1])

        var anchor = drawing.createAnchor
		(startX[1], startY[1], endX[1], endY[1],
		startX[0], startY[0], endX[0], endY[0])

	var shape = drawing.createSimpleShape(anchor)

	shape.setShapeType(ShapeTypes.ELLIPSE)

	shape.setLineWidth (0.75)

	if (color == "red")
		{
	shape.setLineStyleColor(255, 0, 0) // red
		}
	else if (color == "green")
		{
	shape.setLineStyleColor(0,255,0) // green
		}
	else if (color == "blue")
		{
		shape.setLineStyleColor(0,0,255) // blue
		}
	else if (color == "cyan")
		{
		shape.setLineStyleColor(0,255,255) //
		}
	else if (color == "yellow")
		{
		shape.setLineStyleColor(255,255,0) //
		}
	else if (color == "magenta")
		{
		shape.setLineStyleColor(255,0,255) //
		}
	else
		{
	shape.setLineStyleColor (0,0,0) // black
		}

}

// ---------------------------------------------------------------------
function draw_textbox_proc (sheet,drawing,
	pos_center,arm_width,arm_height,message)
{
	var xx_range = [pos_center[0] - arm_width,pos_center[0] + arm_width]
	var yy_range = [pos_center[1] - arm_height,pos_center[1] + arm_height]

	var startX = getAnchorX (sheet,xx_range[0])
	var endX = getAnchorX (sheet,xx_range[1])
	var startY = getAnchorY (sheet,yy_range[0])
	var endY = getAnchorY (sheet,yy_range[1])

	var anchor = drawing.createAnchor
		(startX[1],startY[1],endX[1],endY[1],
		startX[0],startY[0],endX[0],endY[0])

        var textBox = drawing.createTextbox (anchor)
	textBox.setText (message)
	textBox.setLineWidth (1)
	textBox.setLineStyleColor (255,0,0)
}

// ---------------------------------------------------------------------
function draw_line_proc
	(sheet,drawing,pos_start,pos_end,color)
{
	var xx_range = [pos_start[0],pos_end[0]]
	var yy_range = [pos_start[1],pos_end[1]]


        var startX = getAnchorX (sheet,xx_range[0])
        var endX = getAnchorX (sheet,xx_range[1])
        var startY = getAnchorY (sheet,yy_range[0])
        var endY = getAnchorY (sheet,yy_range[1])

        var anchor = drawing.createAnchor
		(startX[1], startY[1], endX[1], endY[1],
		startX[0], startY[0], endX[0], endY[0])

	var shape = drawing.createSimpleShape(anchor)

	shape.setShapeType(ShapeTypes.LINE)

//	shape.setLineWidth (0.75)
	shape.setLineWidth (2)

	if (color == "red")
		{
	shape.setLineStyleColor(255, 0, 0) // red
		}
	else if (color == "green")
		{
	shape.setLineStyleColor(0,255,0) // green
		}
	else if (color == "blue")
		{
		shape.setLineStyleColor(0,0,255) // blue
		}
	else if (color == "cyan")
		{
		shape.setLineStyleColor(0,255,255) //
		}
	else if (color == "yellow")
		{
		shape.setLineStyleColor(255,255,0) //
		}
	else if (color == "magenta")
		{
		shape.setLineStyleColor(255,0,255) //
		}
	else
		{
	shape.setLineStyleColor (0,0,0) // black
		}

}

// ---------------------------------------------------------------------
function draw_cross_proc (sheet,drawing,pos_center,radius,color)
{
	var pos_start = [pos_center[0] - radius,pos_center[1]]
	var pos_end = [pos_center[0] + radius,pos_center[1]]

	draw_line_proc (sheet,drawing,pos_start,pos_end,color)

	var pos_low = [pos_center[0],pos_center[1] - radius]
	var pos_up = [pos_center[0],pos_center[1] + radius]

	draw_line_proc (sheet,drawing,pos_low,pos_up,color)
}

// ---------------------------------------------------------------------

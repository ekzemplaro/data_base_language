// ---------------------------------------------------------------------
//
//	java/common/poi_common.java
//
//					Sep/29/2015
//
// ---------------------------------------------------------------------
import java.io.*;

import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFShape;
import org.apache.poi.xssf.usermodel.XSSFSimpleShape;
import org.apache.poi.xssf.usermodel.XSSFTextBox;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.ShapeTypes;

import java.awt.Color;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

import org.openxmlformats.schemas.drawingml.x2006.main.CTLineEndProperties;
import org.openxmlformats.schemas.drawingml.x2006.main.CTLineProperties;
import org.openxmlformats.schemas.drawingml.x2006.main.CTShapeProperties;
import org.openxmlformats.schemas.drawingml.x2006.main.STLineEndType;
// ---------------------------------------------------------------------
public class poi_common{
// ---------------------------------------------------------------------
static int[] getAnchorX(Sheet sheet, int xInPixel)
{
	int rvalue [] = {0,0};

	int xInEMU = xInPixel * XSSFShape.EMU_PER_PIXEL;
	int currentInXEMU = 0;

	Row row = sheet.getRow(0);
	if (row == null) {
            row = sheet.createRow(0);
	}
        for (int columnNum = 0;; columnNum++) {
            if (row.getCell(columnNum) == null) {
                row.createCell(columnNum);
            }

            if (sheet.getColumnWidth(columnNum) == sheet.getDefaultColumnWidth() * 256) {
                // Excelのデフォルト値は違うので明示的に設定する
                sheet.setColumnWidth(columnNum, 9 * 256);
            }

            // Excelでは256columnWidthが8ピクセル
            int columnWidthInEMU = sheet.getColumnWidth(columnNum) / 256 * 8 * XSSFShape.EMU_PER_PIXEL;
            if (xInEMU < currentInXEMU + columnWidthInEMU) {
		rvalue[0] = columnNum;
		rvalue[1] = xInEMU - currentInXEMU;
		break;
            }
            currentInXEMU += columnWidthInEMU;
        }

	return	rvalue;
}

// ---------------------------------------------------------------------
static int[] getAnchorY(Sheet sheet, int yInPixel)
{
	int rvalue [] = {0,0};
	int yInEMU = yInPixel * XSSFShape.EMU_PER_PIXEL;
	int currentYInEMU = 0;

	for (int rowNum = 0;;rowNum++) {
            Row currentRow = sheet.getRow(rowNum);
            if (currentRow == null) {
                currentRow = sheet.createRow(rowNum);
            }

	if (currentRow.getHeight() == sheet.getDefaultRowHeight()) {
                // Excelのデフォルト値は違うので明示的に設定する
                currentRow.setHeightInPoints(13.5f);
		}

            // 行の高さ（EMU）
            // ※row.getHeight()は1/20ポイント単位
            int rowHeightInEMU = (int)(currentRow.getHeight() / 20.0D * XSSFShape.EMU_PER_POINT);
            if (yInEMU < currentYInEMU + rowHeightInEMU) {
		rvalue[0] = rowNum;
		rvalue[1] = yInEMU - currentYInEMU;
		break;
		}
		currentYInEMU += rowHeightInEMU;
	}
	return	rvalue;
}

// ---------------------------------------------------------------------
static void workbook_out_proc (Workbook workbook,String xlsx_out)
{
        File file = new File (xlsx_out);

        try (OutputStream out = new FileOutputStream(file)) {
            workbook.write(out);
		out.close ();
        }
	catch(Exception ee)
		{
		ee.printStackTrace(System.err);
		System.exit(1);
		}
}

// ---------------------------------------------------------------------
static XSSFWorkbook workbook_read_proc (String xlsx_in)
{
	XSSFWorkbook workbook = new XSSFWorkbook ();

	try
		{
		FileInputStream fi=new FileInputStream (xlsx_in);
		workbook =new XSSFWorkbook(fi);
		fi.close();
		}
	catch(Exception ee)
		{
		ee.printStackTrace(System.err);
		System.exit(1);
		}

	return	workbook;
}

// ---------------------------------------------------------------------
static void draw_circle_proc
	(Sheet sheet,XSSFDrawing drawing,int pos_center[],int radius,String color)
{
	int [] xx_range = {pos_center[0] - radius,pos_center[0] + radius};
	int [] yy_range = {pos_center[1] - radius,pos_center[1] + radius};

        int[] startX = poi_common.getAnchorX (sheet,xx_range[0]);
        int[] endX = poi_common.getAnchorX (sheet,xx_range[1]);
        int[] startY = poi_common.getAnchorY (sheet,yy_range[0]);
        int[] endY = poi_common.getAnchorY (sheet,yy_range[1]);

        XSSFClientAnchor anchor = drawing.createAnchor
		(startX[1], startY[1], endX[1], endY[1],
		startX[0], startY[0], endX[0], endY[0]);

	XSSFSimpleShape shape = drawing.createSimpleShape(anchor);

	shape.setShapeType(ShapeTypes.ELLIPSE);

	shape.setLineWidth (0.75);

	if (color == "red")
		{
	shape.setLineStyleColor(255, 0, 0); // red
		}
	else if (color == "green")
		{
	shape.setLineStyleColor(0,255,0); // green
		}
	else if (color == "blue")
		{
		shape.setLineStyleColor(0,0,255); // blue
		}
	else if (color == "cyan")
		{
		shape.setLineStyleColor(0,255,255); //
		}
	else if (color == "yellow")
		{
		shape.setLineStyleColor(255,255,0); //
		}
	else if (color == "magenta")
		{
		shape.setLineStyleColor(255,0,255); //
		}
	else
		{
	shape.setLineStyleColor (0,0,0); // black
		}
}

// ---------------------------------------------------------------------
static void draw_textbox_proc (Sheet sheet,XSSFDrawing drawing,
	int pos_center[],int arm_width,int arm_height,String message)
{
	int [] xx_range = {pos_center[0] - arm_width,pos_center[0] + arm_width};
	int [] yy_range = {pos_center[1] - arm_height,pos_center[1] + arm_height};

	int[] startX = poi_common.getAnchorX (sheet,xx_range[0]);
	int[] endX = poi_common.getAnchorX (sheet,xx_range[1]);
	int[] startY = poi_common.getAnchorY (sheet,yy_range[0]);
	int[] endY = poi_common.getAnchorY (sheet,yy_range[1]);

	XSSFClientAnchor anchor = drawing.createAnchor
		(startX[1],startY[1],endX[1],endY[1],
		startX[0],startY[0],endX[0],endY[0]);

        XSSFTextBox textBox = drawing.createTextbox (anchor);
	textBox.setText (message);
	textBox.setLineWidth (1);
	textBox.setLineStyleColor (255,0,0);
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

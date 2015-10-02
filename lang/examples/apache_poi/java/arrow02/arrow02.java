// ---------------------------------------------------------------------
//
//	arrow02.java
//
//					Sep/29/2015
//
// ---------------------------------------------------------------------
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFShape;
import org.apache.poi.xssf.usermodel.XSSFSimpleShape;
import org.apache.poi.xssf.usermodel.XSSFSheet;

import org.apache.poi.ss.usermodel.ShapeTypes;

import org.openxmlformats.schemas.drawingml.x2006.main.CTLineEndProperties;
import org.openxmlformats.schemas.drawingml.x2006.main.CTLineProperties;
import org.openxmlformats.schemas.drawingml.x2006.main.CTShapeProperties;
import org.openxmlformats.schemas.drawingml.x2006.main.STLineEndType;
// ---------------------------------------------------------------------
public class arrow02{
// ---------------------------------------------------------------------
static void draw_arrow_proc
	(XSSFDrawing drawing,XSSFClientAnchor anchor,String color)
{
	XSSFSimpleShape shape = drawing.createSimpleShape(anchor);

	shape.setShapeType(ShapeTypes.LINE);
// shape.setLineWidth(1); // 線の幅: 1px
	shape.setLineWidth(5); // 線の幅: 1px

	if (color == "red")
		{
	shape.setLineStyleColor(255, 0, 0); // red
		}
	else if (color == "green")
		{
	shape.setLineStyleColor(0,255,0); // green
		}
	else
		{
	shape.setLineStyleColor(0,0,255); // blue
		}

// Open XML Formats
	CTShapeProperties shape1prop = shape.getCTShape().getSpPr();
	CTLineProperties shape1lp = shape1prop.getLn();
	CTLineEndProperties shape1lep = shape1lp.addNewTailEnd();
	shape1lep.setType(STLineEndType.Enum.forString("arrow")); // 線の終了を矢印に

}

// ---------------------------------------------------------------------
public static void main (String[]args) throws Exception
{
	System.out.println ("*** start ***");

	XSSFWorkbook workbook = new XSSFWorkbook();

	XSSFSheet sheet = workbook.createSheet();

	XSSFDrawing drawing = (XSSFDrawing) sheet.createDrawingPatriarch();

	XSSFClientAnchor anchor = new XSSFClientAnchor(0,0,0,0, 0, 0, 3,3);
	draw_arrow_proc (drawing,anchor,"red");

	XSSFClientAnchor anchor_bb = new XSSFClientAnchor(0,0,0,0, 4, 4, 5,5 );
	draw_arrow_proc (drawing,anchor_bb,"green");

	XSSFClientAnchor anchor_cc = new XSSFClientAnchor(0, 0, 0, 0,6,6,7,7);
	draw_arrow_proc (drawing,anchor_cc,"blue");

	String xlsx_out = "ex002.xlsx";
        poi_common.workbook_out_proc (workbook,xlsx_out);

	System.out.println ("*** end ***");
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------

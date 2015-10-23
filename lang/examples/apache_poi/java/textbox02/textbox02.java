// ---------------------------------------------------------------------
//
//	textbox02.java
//
//					Sep/29/2015
//
// ---------------------------------------------------------------------
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Sheet;
// ---------------------------------------------------------------------
public class textbox02{
// ---------------------------------------------------------------------
public static void main (String[]args) throws Exception
{
	System.out.println ("*** start ***");

	String xlsx_in = args[0];
	String xlsx_out = args[1];

	System.out.println (xlsx_in);
	System.out.println (xlsx_out);

	int [][] pos_org = {{-241,96},{-345,96},
				{-241,184},{-345,184},
				{-241,272},{-345,272},
				{-241,360},{-345,360},
				{-241,448},{-345,448}
				};

	XSSFWorkbook workbook = poi_common.workbook_read_proc (xlsx_in);

//	Sheet sheet = workbook.getSheetAt (0);
	XSSFSheet sheet = workbook.getSheetAt (0);

	XSSFDrawing drawing = (XSSFDrawing) sheet.createDrawingPatriarch();

/*
try (Workbook workbook = new XSSFWorkbook()) {
        Sheet sheet = workbook.createSheet();
        XSSFDrawing drawing = (XSSFDrawing)sheet.createDrawingPatriarch();
*/
	int [] pos_center = {100,200};
	int arm_width = 40;
	int arm_height = 20;
	poi_common.draw_textbox_proc (sheet,drawing,pos_center,arm_width,arm_height,"Morning");

	pos_center[0] = 200; 
	poi_common.draw_textbox_proc (sheet,drawing,pos_center,arm_width,arm_height,"Afternoon");
	pos_center[0] = 300; 
	poi_common.draw_textbox_proc (sheet,drawing,pos_center,arm_width,arm_height,"Evening");

	poi_common.workbook_out_proc (workbook,xlsx_out);
 //   }
	System.out.println ("*** end ***");
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
